module toy_lsu_wb
    import toy_pack::*;
(
    input  logic                                clk                 ,
    input  logic                                rst_n               ,

    input  logic                                cancel_en           ,
    input  logic                                mem_vld             ,
    input  mem_ack_pkg                          mem_pld             ,
    // reg access
    output logic [PHY_REG_ID_WIDTH-1    :0]     reg_index           ,
    output logic                                reg_wr_en           ,
    output logic [REG_WIDTH-1           :0]     reg_val             ,
    output logic                                fp_reg_wr_en        ,
    // commit 
    output logic                                commit_en           ,
    output logic [INST_IDX_WIDTH-1      :0]     commit_id           

);

    //##############################################
    // logic
    //############################################## 
    logic       [DATA_WIDTH-1   :0]     shifted_rd_data     ;
    // mem_ack_pkg                         mem_pld_reg         ;
    // logic                               mem_vld_reg         ;
    //##############################################
    // 1 cycle wb
    //############################################## 
    // always_ff @(posedge clk) begin
    //     if(mem_vld)begin
    //         mem_pld_reg <= mem_pld;
    //     end
    // end
    // always_ff @(posedge clk or negedge rst_n) begin
    //     if(~rst_n)begin
    //         mem_vld_reg <= 1'b0;
    //     end
    //     else if(cancel_en)begin
    //         mem_vld_reg <= 1'b0;
    //     end
    //     else begin
    //         mem_vld_reg <= mem_vld;
    //     end
    // end
    assign commit_en    = mem_vld;
    assign commit_id    = mem_pld.mem_ack_sideband[16:11];
    assign reg_wr_en    = mem_vld & mem_pld.mem_ack_sideband[4];
    assign fp_reg_wr_en = mem_vld & mem_pld.mem_ack_sideband[3];
    assign reg_index    = mem_pld.mem_ack_sideband[10:5];
    // assign shifted_rd_data  = (mem_pld_reg.mem_ack_data >> mem_pld_reg.mem_ack_sideband[20:17]*8)  ;
    assign shifted_rd_data  = mem_pld.mem_ack_data  ;
    always_comb begin
        case(mem_pld.mem_ack_sideband[2:0])
            F3_LB       :   reg_val = {{24{shifted_rd_data[7]}}   ,   shifted_rd_data[7:0]    };
            F3_LBU      :   reg_val = {24'b0                      ,   shifted_rd_data[7:0]    };
            F3_LH       :   reg_val = {{16{shifted_rd_data[15]}}  ,   shifted_rd_data[15:0]   };
            F3_LHU      :   reg_val = {16'b0                      ,   shifted_rd_data[15:0]   };
            F3_LW       :   reg_val = shifted_rd_data[31:0];
            default     :   reg_val = shifted_rd_data[31:0];
        endcase
    end

endmodule
