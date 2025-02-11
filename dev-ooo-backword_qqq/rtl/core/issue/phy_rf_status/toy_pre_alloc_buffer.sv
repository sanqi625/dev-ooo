module toy_pre_alloc_buffer 
    import toy_pack::*;
#(
    parameter   int unsigned CHANNEL      = 4                     ,
    parameter   type         PLD_TYPE     = logic [PHY_REG_ID_WIDTH-1  :0]
)
(
    input  logic                                clk                             ,
    input  logic                                rst_n                           ,

    input  logic [CHANNEL-1         :0]         v_s_vld                         ,
    output logic [CHANNEL-1         :0]         v_s_rdy                         ,
    input  PLD_TYPE                             v_s_pld [CHANNEL-1      :0]     ,

    output logic [CHANNEL-1         :0]         v_m_vld                         ,
    input  logic [CHANNEL-1         :0]         v_m_rdy                         ,
    output PLD_TYPE                             v_m_pld [CHANNEL-1      :0]     ,

    input logic                                 cancel_edge_en                       
);
    //need imporve todo 
    logic                                set_rst_n;
    logic [CHANNEL-1         :0]         v_m_vld_temp                         ;
    logic [CHANNEL-1         :0]         v_s_rdy_temp                         ;
    assign set_rst_n = rst_n & (~cancel_edge_en)  ;
    generate

        for(genvar i=0;i<CHANNEL;i=i+1)begin
            cmn_reg_slice_full #(
                .PLD_TYPE   (logic [PHY_REG_ID_WIDTH-1  :0])
            )u_cmn_reg_slice_full(
                .clk        (clk            ),
                .rst_n      (set_rst_n      ),
                .s_vld      (v_s_vld[i]     ),
                .s_rdy      (v_s_rdy_temp[i]),
                .s_pld      (v_s_pld[i]     ),
                .m_vld      (v_m_vld_temp[i]),
                .m_rdy      (v_m_rdy[i]     ),  
                .m_pld      (v_m_pld[i]     )
            );
            assign v_s_rdy[i] = v_s_rdy_temp[i] & ~cancel_edge_en;
            if(i==0)begin
                assign v_m_vld[i] = v_m_vld_temp[i] ;
            end
            else begin
                assign v_m_vld[i] = v_m_vld_temp[i] & (&v_m_vld_temp[i-1:0]);
            end
        end

    endgenerate











endmodule