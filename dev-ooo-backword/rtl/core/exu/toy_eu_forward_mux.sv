module toy_eu_forward_mux
    import toy_pack::*;
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    // wr back data
    input  logic [REG_WIDTH-1           :0]     v_forward_data              [EU_NUM-1           :0],
    input  logic                                eu_en                       ,
    input  eu_pkg                               eu_pld                      ,
    input                                       cancel_en                   ,

    output logic                                forward_en                  ,
    output forward_pkg                          forward_pld                 
    );

    //##############################################
    // forward need imporve todo
    //############################################## 
    eu_pkg                               eu_pld_d;
    always_ff @(posedge clk or negedge rst_n) begin 
        if(~rst_n)begin
            eu_pld_d <= {$bits(eu_pkg){1'b0}};
        end
        else if(eu_en)begin
            eu_pld_d <= eu_pld;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin 
        if(~rst_n)begin
            forward_en <= 0;
        end
        else if(cancel_en)begin
            forward_en <= 0;
        end
        else begin
            forward_en <= eu_en;
        end
    end

    assign forward_pld.reg_rs1_val = eu_pld_d.rs1_forward_cycle[1] ? v_forward_data[eu_pld_d.rs1_forward_id]:eu_pld_d.reg_rs1_val ;
    assign forward_pld.reg_rs2_val = eu_pld_d.rs2_forward_cycle[1] ? v_forward_data[eu_pld_d.rs2_forward_id]:eu_pld_d.reg_rs2_val ;
    assign forward_pld.reg_rs3_val = eu_pld_d.rs3_forward_cycle[1] ? v_forward_data[eu_pld_d.rs3_forward_id]:eu_pld_d.reg_rs3_val ;

    assign forward_pld.inst_pld       = eu_pld_d.inst_pld      ;
    assign forward_pld.inst_id        = eu_pld_d.inst_id       ;
    assign forward_pld.arch_reg_index = eu_pld_d.arch_reg_index;
    assign forward_pld.inst_rd        = eu_pld_d.inst_rd       ;
    assign forward_pld.inst_rd_en     = eu_pld_d.inst_rd_en    ;
    assign forward_pld.inst_fp_rd_en  = eu_pld_d.inst_fp_rd_en ;
    assign forward_pld.c_ext          = eu_pld_d.c_ext         ;
    assign forward_pld.inst_pc        = eu_pld_d.inst_pc       ;
    assign forward_pld.inst_imm       = eu_pld_d.inst_imm      ;
    assign forward_pld.fe_bypass_pld  = eu_pld_d.fe_bypass_pld ;


endmodule