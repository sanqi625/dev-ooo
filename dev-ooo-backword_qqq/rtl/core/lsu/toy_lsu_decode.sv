module toy_lsu_decode 
    import toy_pack::*;
(
    input  logic                      clk                           ,
    input  logic                      rst_n                         ,

    input  logic                      s_vld                         ,
    output logic                      s_rdy                         ,
    input  agu_pkg                    s_pld                         ,

    output agu_pkg                    m_pld                         ,
    output logic                      m_vld_dtcm                    , // to cache
    input  logic                      m_rdy_dtcm                    , // cache give
    output logic                      m_vld_dcache                  , // to cache
    input  logic                      m_rdy_dcache                    // cache give


);


    //##############################################
    // deocode for dtcm dcache
    //############################################## 

    assign s_rdy = m_rdy_dcache & m_rdy_dtcm;
    assign m_pld = s_pld;

    assign m_vld_dtcm   = s_vld && s_pld.mem_req_addr >= DTCM_LOWER && s_pld.mem_req_addr <= DTCM_HIGHER;
    assign m_vld_dcache = s_vld && (s_pld.mem_req_addr < DTCM_LOWER || s_pld.mem_req_addr > DTCM_HIGHER);

endmodule
