module toy_fanout
    import toy_pack::*;
(
    input  logic                      clk               ,
    input  logic                      rst_n             ,

    input  logic                      s_vld             ,
    output logic                      s_rdy             ,
    input  agu_pkg                    s_pld             ,

    output agu_pkg                    m_pld             ,
    output logic                      m_load_vld        , // to cache
    input  logic                      m_load_rdy        , // cache give

    output logic                      m_store_en        ,
    output logic                      m_hazard_en       , // same as to cache 
    input  logic                      hazard_flag         // hazard rdy


);

    //##############################################
    // fanout 
    //############################################## 
    assign s_rdy        = ~hazard_flag;
    
    assign m_load_vld   = s_vld && ~s_pld.mem_req_opcode & ~hazard_flag  ;
    assign m_pld        = s_pld;

    assign m_store_en   = s_vld && s_pld.mem_req_opcode & ~hazard_flag  ;
    assign m_hazard_en  = m_load_vld & m_load_rdy;
endmodule
