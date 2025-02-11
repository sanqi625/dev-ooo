module toy_dtcm_wrapper
    import toy_pack::*;
(
    input  logic                            clk                           ,
    input  logic                            rst_n                         ,

    input  logic                            dtcm_req_vld                  ,
    input  logic [FETCH_SB_WIDTH-1      :0] dtcm_req_sideband             ,

    // input  logic                            dcache_forward_en             ,
    // input  logic [FETCH_SB_WIDTH-1      :0] dcache_sideband               ,

    output logic                            forward_dtcm_int_en           ,
    output logic                            forward_dtcm_fp_en            ,
    output logic [PHY_REG_ID_WIDTH-1    :0] forward_dtcm_phy_id           ,

    // output logic                            forward_dcache_en             ,
    // output logic [PHY_REG_ID_WIDTH-1    :0] forward_dcache_phy_id         ,

    input  logic                            cancel_en                     ,
    input  logic                            mem_vld                       ,
    input  mem_ack_pkg                      mem_pld                       ,

    input  logic                            cancel_noack_en               ,
    input  logic                            cancel_ack_en                 ,
    input  mem_ack_pkg                      cancel_ack_pld                ,

    output mem_ack_pkg                      tcm_pld                       ,
    output logic                            tcm_en                    


);
    //##############################################
    // logic 
    //############################################## 
    logic                           cancel_ack_reg;
    logic                           cancel_noack_reg;
    logic                           dtcm_req_vld_reg;
    logic [FETCH_SB_WIDTH-1    :0]  dtcm_req_sideband_reg;
    mem_ack_pkg                     cancel_pld_reg;
    //##############################################
    // mask en
    //############################################## 
    assign forward_dtcm_int_en = dtcm_req_sideband_reg[4] & dtcm_req_vld_reg & ~cancel_noack_en;
    assign forward_dtcm_fp_en =  dtcm_req_sideband_reg[3] & dtcm_req_vld_reg & ~cancel_noack_en;
    assign forward_dtcm_phy_id = dtcm_req_sideband_reg[10:5];
    // assign forward_dcache_en = dcache_forward_en;
    // assign forward_dcache_phy_id = dcache_sideband[10:5];

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            dtcm_req_vld_reg <= 0;
        end
        else if(cancel_en)begin
            dtcm_req_vld_reg <= 0;
        end
        else begin
            dtcm_req_vld_reg <= dtcm_req_vld;
        end
    end

    always_ff @(posedge clk) begin
        if(dtcm_req_vld)begin
            dtcm_req_sideband_reg <= dtcm_req_sideband;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            cancel_ack_reg <= 0;
            cancel_noack_reg <= 0;
        end
        else if(cancel_en)begin
            cancel_ack_reg <= 0;
            cancel_noack_reg <= 0;
        end
        else begin
            cancel_ack_reg <= cancel_ack_en;
            cancel_noack_reg <= cancel_noack_en;
        end
    end
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            cancel_pld_reg <= {$bits(mem_ack_pkg){1'b0}};
        end
        else if(cancel_ack_en)begin
            cancel_pld_reg <= cancel_ack_pld;
        end
    end

    assign tcm_en = ~cancel_noack_reg & (mem_vld | cancel_ack_reg);
    // assign tcm_pld = cancel_ack_reg ? cancel_pld_reg : mem_pld ;

    always_comb begin
        if(cancel_ack_reg)begin
            tcm_pld = cancel_pld_reg;
        end
        else begin
            tcm_pld = mem_pld;
            tcm_pld.mem_ack_data = (mem_pld.mem_ack_data >> mem_pld.mem_ack_sideband[21:17]*8)  ;
        end
        
    end

endmodule
