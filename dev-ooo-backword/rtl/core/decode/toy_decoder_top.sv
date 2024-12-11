    
    
    

module toy_decoder_top
    import toy_pack::*;
(
    input  logic                                clk                             ,
    input  logic                                rst_n                           ,

    input  logic [INST_READ_CHANNEL-1   :0]     v_fetched_instruction_vld       ,
    output logic [INST_READ_CHANNEL-1   :0]     v_fetched_instruction_rdy       ,
    input  logic [INST_WIDTH-1          :0]     v_fetched_instruction_pld       [INST_READ_CHANNEL-1:0]     , 
    input  logic [ADDR_WIDTH-1          :0]     v_fetched_instruction_pc        [INST_READ_CHANNEL-1:0]     ,
    input  logic [INST_IDX_WIDTH-1      :0]     v_fetched_instruction_idx       [INST_READ_CHANNEL-1:0]     ,    
    input  fe_bypass_pkg                        v_fe_bypass_pld                 [INST_READ_CHANNEL-1:0]     ,
    // decode out 
    output logic   [INST_DECODE_NUM-1   :0]     v_decode_vld                    ,
    input  logic   [INST_DECODE_NUM-1   :0]     v_decode_rdy                    ,
    output decode_pkg                           v_decode_pld                    [INST_DECODE_NUM-1:0],

    input  logic                                csr_intr_instruction_vld        ,
    output logic                                csr_intr_instruction_rdy     
);
    
    //##############################################
    // logic  
    //##############################################
    logic [INST_DECODE_NUM-1:0]v_csr_intr_instruction_rdy;

    assign v_fetched_instruction_rdy[7:4] = 4'b0;
    
    assign csr_intr_instruction_rdy = v_csr_intr_instruction_rdy[0];
    
    
    
    
    //##############################################
    // decode 
    //##############################################
    
    generate
        for (genvar i=0;i<INST_DECODE_NUM;i=i+1)begin:DECODE_GEN
            toy_decoder u_dec (
                .clk                (clk                             ),
                .rst_n              (rst_n                           ),
                .fetched_inst_vld   (v_fetched_instruction_vld[i]    ),
                .fetched_inst_rdy   (v_fetched_instruction_rdy[i]    ),
                .fetched_inst_pld   (v_fetched_instruction_pld[i]    ), 
                .fetched_inst_pc    (v_fetched_instruction_pc[i]     ),
                .fetched_inst_id    (v_fetched_instruction_idx[i]    ),
                .fe_bypass_pld      (v_fe_bypass_pld[i]              ),
                .csr_intr_instruction_vld(csr_intr_instruction_vld   ),
                .csr_intr_instruction_rdy(v_csr_intr_instruction_rdy[i]),
                .decode_pld         (v_decode_pld[i]                 ),
                .dec_inst_vld       (v_decode_vld[i]                 ),
                .dec_inst_rdy       (v_decode_rdy[i]                 )
                );

        end
    endgenerate


endmodule