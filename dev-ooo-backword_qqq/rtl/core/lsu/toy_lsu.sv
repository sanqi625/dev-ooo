module toy_lsu 
    import toy_pack::*;
(
    input  logic                                clk                         ,
    input  logic                                rst_n                       ,

    input  logic [3                     :0]     v_instruction_en            ,
    input  eu_pkg                               v_lsu_pld              [3:0],
    input  logic [3                     :0]     v_lsu_stu_en                ,
    output logic [$clog2(LSU_DEPTH)     :0]     lsu_buffer_rd_ptr           ,
    input  logic [REG_WIDTH-1           :0]     v_forward_data  [EU_NUM-1:0],

    // reg access
    output logic [PHY_REG_ID_WIDTH-1    :0]     reg_index              [2:0],
    output logic [2                     :0]     reg_wr_en                   ,
    output logic [REG_WIDTH-1           :0]     reg_val                [2:0],
    output logic [2                     :0]     fp_reg_wr_en                ,
    // commit 
    input  logic [3                     :0]     v_st_ack_commit_en          ,
    input  logic [$clog2(STU_DEPTH)-1   :0]     v_st_ack_commit_entry  [3:0],
    // forward
    output logic                                forward_dtcm_int_en         ,
    output logic                                forward_dtcm_fp_en          ,
    output logic [PHY_REG_ID_WIDTH-1    :0]     forward_dtcm_phy_id         ,

    output logic                                stq_commit_en               ,
    output logic [INST_IDX_WIDTH-1      :0]     stq_commit_id               ,
    output stq_commit_pkg                       stq_commit_pld              ,
    output logic [1                     :0]     v_ld_commit_en              ,
    output logic [INST_IDX_WIDTH-1      :0]     v_ld_commit_id         [1:0],

    input  logic                                cancel_en                   ,
    input  logic                                cancel_edge_en              , 
    //mem access
    output logic                                mem_req_vld                 ,
    input  logic                                mem_req_rdy                 ,
    output logic [ADDR_WIDTH-1          :0]     mem_req_addr                ,
    output logic [DATA_WIDTH-1          :0]     mem_req_data                ,
    output logic [DATA_WIDTH/8-1        :0]     mem_req_strb                ,
    output logic                                mem_req_opcode              ,
    output logic [FETCH_SB_WIDTH-1      :0]     mem_req_sideband            ,

    input  logic [FETCH_SB_WIDTH-1      :0]     mem_ack_sideband            ,
    input  logic                                mem_ack_vld                 ,
    output logic                                mem_ack_rdy                 ,
    input  logic [DATA_WIDTH-1          :0]     mem_ack_data        

);

    //##############################################
    // always ready
    //############################################## 
    assign mem_ack_rdy          = 1'b1;

    //##############################################
    // todo
    //############################################## 
    assign reg_wr_en[2:1]       = 0;
    assign fp_reg_wr_en[2:1]    = 0;
    assign v_ld_commit_en[1]    = 0;
    assign v_ld_commit_id[1]    = 0;
    //##############################################
    // logic
    //############################################## 
    logic                               lsu_vld             ;
    logic                               lsu_rdy             ;
    logic                               stq_credit_en       ;
    logic                               agu_vld             ;
    logic                               agu_rdy             ;
    logic                               load_vld            ;
    logic                               load_rdy            ;
    logic                               store_en            ;
    logic                               hazard_en           ;
    logic                               hazard_flag         ;
    logic                               m_por_vld           ;
    logic                               m_por_rdy           ;
    logic                               re_req_vld          ;
    logic                               store_vld           ;
    logic                               re_req_rdy          ;
    logic                               store_rdy           ;
    logic                               decode_vld_dtcm     ;
    logic                               decode_rdy_dtcm     ;
    logic                               decode_vld_dcache   ;
    logic                               decode_rdy_dcache   ;
    logic                               cancel_noack_en     ;
    logic                               cancel_ack_en       ;
    logic                               tcm_en              ;

    logic [STU_DEPTH-1          :0]     v_stq_en            ;
    logic [$clog2(STU_DEPTH)-1  :0]     stq_wr_ptr          ;
    logic [$clog2(STU_DEPTH)-1  :0]     stq_commit_cnt      ;
    logic [3                    :0]     stq_credit_num      ;
    logic [2                    :0]     v_por_vld           ;
    logic [2                    :0]     v_por_rdy           ;

    mem_ack_pkg                         tcm_pld             ;
    mem_ack_pkg                         mem_ack_pld         ;
    mem_ack_pkg                         cancel_ack_pld      ;
    agu_pkg                             re_req_pld          ;
    agu_pkg                             store_pld           ;
    agu_pkg                             decode_pld          ;
    agu_pkg                             m_por_pld           ;
    agu_pkg                             agu_pld             ;
    agu_pkg                             fanout_pld          ;
    eu_pkg                              lsu_pld             ;
    agu_pkg                             v_stq_pld           [STU_DEPTH-1:0];
    agu_pkg                             v_por_pld           [2          :0];
    logic                               lsu_stu_en          ; //***
    //##############################################
    // lsu buffer
    //############################################## 
    toy_lsu_buffer #(
        .S_CHANNEL(4),
        .DEPTH(LSU_DEPTH)
    )u_toy_lsu_buffer(
        .clk              (clk                    ),
        .rst_n            (rst_n                  ),
        .v_s_lsu_vld      (v_instruction_en       ),
        .v_s_lsu_pld      (v_lsu_pld              ),
        .v_s_lsu_stu_en   (v_lsu_stu_en           ),
        .stq_commit_pld   (stq_commit_pld         ),
        .lsu_buffer_rd_ptr(lsu_buffer_rd_ptr      ),
        .v_forward_data   (v_forward_data         ),
        .m_vld            (lsu_vld                ),
        .m_rdy            (lsu_rdy                ),
        .m_pld            (lsu_pld                ),
        .m_stu_en         (lsu_stu_en             ), //***
        .stq_wr_ptr       (stq_wr_ptr             ),
        .cancel_en        (cancel_en              ),
        .stq_commit_cnt   (stq_commit_cnt         ),
        .stu_credit_en    (stq_credit_en          ),
        .stu_credit_num   (stq_credit_num         )
    );

    //##############################################
    // addr gen
    //############################################## 
    toy_agu u_toy_agu(
        .clk            (clk                    ),
        .rst_n          (rst_n                  ),
        .s_vld          (lsu_vld                ),
        .s_rdy          (lsu_rdy                ),
        .s_pld          (lsu_pld                ),
        .s_stu_en       (lsu_stu_en             ), //***
        .m_pld          (agu_pld                ),
        .m_rdy          (agu_rdy                ),
        .m_vld          (agu_vld                )
    );
    //##############################################
    // fanout
    //############################################## 
    toy_fanout u_toy_fanout(
        .clk            (clk                    ),
        .rst_n          (rst_n                  ),
        .s_vld          (agu_vld                ),
        .s_rdy          (agu_rdy                ),
        .s_pld          (agu_pld                ),
        .m_pld          (fanout_pld             ),
        .m_load_vld     (load_vld               ),
        .m_load_rdy     (load_rdy               ),
        .m_store_en     (store_en               ),
        .m_hazard_en    (hazard_en              ),
        .hazard_flag    (hazard_flag            )
    );
    //##############################################
    // priority arb
    //############################################## 
    assign v_por_vld = {store_vld,load_vld,re_req_vld};
    assign store_rdy = v_por_rdy[2];
    assign load_rdy  = v_por_rdy[1];
    assign re_req_rdy= v_por_rdy[0];
    assign v_por_pld[0] = re_req_pld;
    assign v_por_pld[1] = fanout_pld;
    assign v_por_pld[2] = store_pld;
    toy_priority_arb u_toy_priority_arb(

        .clk            (clk                    ),
        .rst_n          (rst_n                  ),
        .v_s_vld        (v_por_vld              ),
        .v_s_rdy        (v_por_rdy              ),
        .v_s_pld        (v_por_pld              ),
        .m_pld          (m_por_pld              ),
        .m_vld          (m_por_vld              ),
        .m_rdy          (m_por_rdy              )
    );

    //##############################################
    // todo
    //############################################## 
    assign decode_rdy_dtcm = 1'b1;
    assign decode_rdy_dcache = 1'b1;
    //##############################################
    // data align
    //############################################## 
    assign mem_req_vld  = decode_vld_dcache;//todo

    assign mem_req_addr = decode_pld.mem_req_addr;
    assign mem_req_data = DATA_WIDTH'(decode_pld.mem_req_data) << (decode_pld.mem_req_addr[4:0]*8);
    assign mem_req_strb = 32'(decode_pld.mem_req_strb) << (decode_pld.mem_req_addr[4:0]);
    assign mem_req_sideband = decode_pld.mem_req_sideband;
    assign mem_req_opcode = decode_pld.mem_req_opcode;
    assign mem_ack_pld.mem_ack_data = mem_ack_data;
    assign mem_ack_pld.mem_ack_sideband = mem_ack_sideband;
    //##############################################
    // decode - dtcm dcahce
    //############################################## 
    toy_lsu_decode u_toy_lsu_decode(
        .clk            (clk                    ),
        .rst_n          (rst_n                  ),
        .s_vld          (m_por_vld              ),
        .s_rdy          (m_por_rdy              ),
        .s_pld          (m_por_pld              ),
        .m_pld          (decode_pld             ),
        .m_vld_dtcm     (decode_vld_dtcm        ),
        .m_rdy_dtcm     (decode_rdy_dtcm        ),
        .m_vld_dcache   (decode_vld_dcache      ),
        .m_rdy_dcache   (decode_rdy_dcache      )
    );

    //##############################################
    // hazard check
    //############################################## 
    toy_lsu_hazard u_toy_lsu_hazard(

        .clk                (clk                ),
        .rst_n              (rst_n              ),
        .ld_hazard_en       (hazard_en          ),
        .ld_hazard_pld      (fanout_pld         ),
        .cancel_en          (cancel_en          ),
        .v_stq_en           (v_stq_en           ),
        .v_stq_pld          (v_stq_pld          ),
        .hazard_flag        (hazard_flag        ),
        .stq_wr_ptr         (stq_wr_ptr         ),
        .cancel_noack_en    (cancel_noack_en    ),
        .cancel_ack_en      (cancel_ack_en      ),
        .cancel_ack_pld     (cancel_ack_pld     ),
        .s_mem_req_pld      (re_req_pld         ),
        .s_mem_req_vld      (re_req_vld         ),
        .s_mem_req_rdy      (re_req_rdy         )
    );

    //##############################################
    // store queue
    //############################################## 
    toy_stq u_toy_stq(
        .clk                (clk                ),
        .rst_n              (rst_n              ),
        .store_en           (store_en           ),
        .store_pld          (fanout_pld         ),
        .v_stq_en           (v_stq_en           ),
        .v_stq_pld          (v_stq_pld          ),
        .stq_credit_en      (stq_credit_en      ),
        .stq_credit_num     (stq_credit_num     ),
        .stq_commit_cnt     (stq_commit_cnt     ),
        .s_mem_req_pld      (store_pld          ),
        .s_mem_req_vld      (store_vld          ),
        .s_mem_req_rdy      (store_rdy          ),
        .stq_wr_ptr         (stq_wr_ptr         ),
        .stq_commit_en      (stq_commit_en      ),
        .stq_commit_id      (stq_commit_id      ),
        .cancel_en          (cancel_en          ),
        .v_st_ack_commit_en (v_st_ack_commit_en ),
        .v_st_ack_commit_entry(v_st_ack_commit_entry)
    );
    //##############################################
    // dtcm mask wrapper
    //############################################## 
    toy_dtcm_wrapper u_toy_dtcm_wrapper(
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        .cancel_en              (cancel_en              ),
        .dtcm_req_vld           (decode_vld_dcache           ),//todo dtcm
        .dtcm_req_sideband      (mem_req_sideband      ),
        // .dcache_forward_en      (dcache_forward_en      ),
        // .dcache_sideband        (dcache_sideband        ),
        .forward_dtcm_int_en    (forward_dtcm_int_en    ),
        .forward_dtcm_fp_en     (forward_dtcm_fp_en     ),
        .forward_dtcm_phy_id    (forward_dtcm_phy_id    ),
        // .forward_dcache_en      (forward_dcache_en      ),
        // .forward_dcache_phy_id  (forward_dcache_phy_id  ),    
        .mem_vld                (mem_ack_vld            ),
        .mem_pld                (mem_ack_pld            ),
        .cancel_noack_en        (cancel_noack_en        ),
        .cancel_ack_en          (cancel_ack_en          ),
        .cancel_ack_pld         (cancel_ack_pld         ),
        .tcm_pld                (tcm_pld                ),
        .tcm_en                 (tcm_en                 )
    );
    //##############################################
    // one cycle wb
    //############################################## 

    toy_lsu_wb u_toy_lsu_wb(
        .clk                (clk                ),
        .rst_n              (rst_n              ),
        .cancel_en          (cancel_en          ),
        .mem_vld            (tcm_en             ),
        .mem_pld            (tcm_pld            ),
        .reg_index          (reg_index[0]       ),
        .reg_wr_en          (reg_wr_en[0]       ),
        .reg_val            (reg_val[0]         ),
        .fp_reg_wr_en       (fp_reg_wr_en[0]    ),
        .commit_en          (v_ld_commit_en[0]  ),
        .commit_id          (v_ld_commit_id[0]  )
    );


    `ifdef TOY_SIM

        logic [31:0] fix_cycle;
        logic [31:0] mem_cycle;
        logic [31:0] st_0;
        logic [31:0] st_1;
        logic [31:0] ld_0;
        logic [31:0] ld_1;


        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                st_0 <= 0 ;
                st_1 <= 0 ;
                ld_0 <= 0 ;
                ld_1 <= 0 ;
            end
            // if(v_m_stu_vld[0])begin
            //     st_0 <= st_0 +1 ;
            // end
            // if(v_m_stu_vld[1])begin
            //     st_1 <= st_1 +1 ;
            // end
            // if(v_m_ldu_vld[0])begin
            //     ld_0 <= ld_0 +1 ;
            // end
            // if(v_m_ldu_vld[1])begin
            //     ld_1 <= ld_1 +1 ;
            // end
        end





        logic fix_priority;
        // assign fix_priority = mem_req_vld && mem_req_rdy && ldq_mem_req_vld && stq_mem_req_vld;
        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                mem_cycle <= 0;
            end
            else if(mem_req_vld && mem_req_rdy) begin
                mem_cycle <= mem_cycle + 1;
            end
        end

        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                fix_cycle <= 0;
            end
            else if(fix_priority) begin
                fix_cycle <= fix_cycle + 1;
            end
        end
        logic [63:0] cycle;
        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)  cycle <= 0;
            else        cycle <= cycle + 1;
        end

        initial begin
            forever begin
                @(posedge clk)
                    if(mem_req_vld && mem_req_opcode==TOY_BUS_WRITE && mem_req_addr<32'ha000_0000 && mem_req_addr>=32'h8000_0000 ) begin
                        $display("[***Warning***]Store ITCM Detect: [mem_req_addr=%h][mem_req_data=%h][cycle=%0d]", mem_req_addr,mem_req_data, cycle);
                    end
            end
        end


    `endif


endmodule
