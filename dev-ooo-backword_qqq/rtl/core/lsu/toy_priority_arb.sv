module toy_priority_arb
    import toy_pack::*;
(
    input  logic                      clk                           ,
    input  logic                      rst_n                         ,

    input  logic      [2:0]           v_s_vld                       ,
    output logic      [2:0]           v_s_rdy                       ,
    input  agu_pkg                    v_s_pld   [2:0]               ,

    output agu_pkg                    m_pld                         ,
    output logic                      m_vld                         , // to cache
    input  logic                      m_rdy                           // cache give



);

    //##############################################
    // priority arb
    //############################################## 
    assign m_vld        = v_s_vld[0] || v_s_vld[1] || v_s_vld[2]  ;

    assign m_pld        = v_s_vld[0] ? v_s_pld[0] : 
                          v_s_vld[1] ? v_s_pld[1] : v_s_pld[2];

    assign v_s_rdy[0]   = m_rdy  ;
    assign v_s_rdy[1]   = v_s_rdy[0] & ~v_s_vld[0] ;
    assign v_s_rdy[2]   = v_s_rdy[1] & ~v_s_vld[1] ;

endmodule
