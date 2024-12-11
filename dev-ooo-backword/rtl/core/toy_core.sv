module toy_core
    import toy_pack::*;
    (
     input  logic                      clk                     ,
     input  logic                      rst_n                   ,

     //input  logic                           fetch_mem_ack_vld       ,
     //output logic                           fetch_mem_ack_rdy       ,
     //input  logic [FETCH_DATA_WIDTH-1:0]    fetch_mem_ack_data      ,
     //input  logic [ROB_ENTRY_ID_WIDTH-1:0]  fetch_mem_ack_entry_id,
     //output logic [ADDR_WIDTH-1:0]          fetch_mem_req_addr      ,
     //output logic                           fetch_mem_req_vld       ,
     //input  logic                           fetch_mem_req_rdy       ,
     //output logic [ROB_ENTRY_ID_WIDTH-1:0]  fetch_mem_req_entry_id,

     input  logic                           fetch_mem_ack_vld       ,
     output logic                           fetch_mem_ack_rdy       ,
     input  logic [FETCH_DATA_WIDTH-1:0]    fetch_mem_ack_data      ,
     //input  logic [ROB_ENTRY_ID_WIDTH-1:0]  fetch_mem_ack_entry_id,
     input logic [1+ICACHE_REQ_OPCODE_WIDTH+MSHR_ENTRY_INDEX_WIDTH+ROB_ENTRY_ID_WIDTH-1:0]fetch_mem_ack_entry_id,
     //icache change 
     output logic [ADDR_WIDTH-1:0]          fetch_mem_req_addr ,
     output logic                           fetch_mem_req_vld  ,
     input logic                            fetch_mem_req_rdy  ,
     output logic [1+ICACHE_REQ_OPCODE_WIDTH+MSHR_ENTRY_INDEX_WIDTH+ROB_ENTRY_ID_WIDTH-1:0]fetch_mem_req_entry_id,
    


     output logic                      lsu_mem_req_vld         ,
     input  logic                      lsu_mem_req_rdy         ,
     output logic [ADDR_WIDTH-1:0]     lsu_mem_req_addr        ,
     output logic [DATA_WIDTH-1:0]     lsu_mem_req_data        ,
     output logic [DATA_WIDTH/8-1:0]   lsu_mem_req_strb        ,
     output logic                      lsu_mem_req_opcode      ,
     output logic [FETCH_SB_WIDTH-1:0] lsu_mem_req_sideband    ,
     input  logic [FETCH_SB_WIDTH-1:0] lsu_mem_ack_sideband    ,
     input  logic                      lsu_mem_ack_vld         ,
     output logic                      lsu_mem_ack_rdy         ,
     input  logic [DATA_WIDTH-1:0]     lsu_mem_ack_data        ,


     output logic                      custom_instruction_vld  ,
     input  logic                      custom_instruction_rdy  ,
     output logic [INST_WIDTH-1:0]     custom_instruction_pld  ,
     output logic [REG_WIDTH-1:0]      custom_rs1_val          ,
     output logic [REG_WIDTH-1:0]      custom_rs2_val          ,
     output logic [ADDR_WIDTH-1:0]     custom_pc               ,

     input  logic                      intr_meip               ,
     input  logic                      intr_msip

    );

    logic                      trap_pc_release_en           ;
    logic                      trap_pc_update_en            ;
    logic [ADDR_WIDTH-1:0]     trap_pc_val                  ;

    logic                      jb_pc_release_en             ;
    logic                      jb_pc_update_en              ;
    logic [ADDR_WIDTH-1:0]     jb_pc_val                    ;

    logic [INST_ALU_NUM-1:0]   v_jb_pc_release_en             ;
    logic [INST_ALU_NUM-1:0]   v_jb_pc_update_en              ;
    logic [ADDR_WIDTH-1:0]     v_jb_pc_val        [INST_ALU_NUM-1:0]  ;


    logic  [INST_READ_CHANNEL-1:0]  v_fetched_instruction_vld      ;
    logic  [INST_READ_CHANNEL-1:0]  v_fetched_instruction_rdy      ;
    logic  [INST_WIDTH_32-1:0]      v_fetched_instruction_pld  [INST_READ_CHANNEL-1:0]    ; 
    logic  [ADDR_WIDTH-1:0]         v_fetched_instruction_pc   [INST_READ_CHANNEL-1:0]    ;
    logic  [INST_IDX_WIDTH-1:0]     v_fetched_instruction_idx  [INST_READ_CHANNEL-1:0]    ;
    fe_bypass_pkg                   v_inst_fe_pld              [INST_READ_CHANNEL-1:0];

    logic                                      fetch_queue_rdy;
    logic                                      fetch_queue_vld;
    fetch_queue_pkg                            fetch_queue_pld     [FILTER_CHANNEL-1:0];
    logic           [FILTER_CHANNEL-1:0]       fetch_queue_en; 

    // alu ==================================================
    logic      [PHY_REG_ID_WIDTH-1:0]     v_alu_reg_index         [INST_ALU_NUM-1    :0] ;
    logic      [INST_ALU_NUM-1    :0]     v_alu_reg_wr_en                                ;
    logic      [REG_WIDTH-1       :0]     v_alu_reg_val           [INST_ALU_NUM-1    :0] ;
    logic      [INST_IDX_WIDTH-1  :0]     v_alu_reg_inst_idx      [INST_ALU_NUM-1    :0] ;
    logic      [INST_ALU_NUM-1    :0]     v_alu_inst_commit_en                           ;
    commit_pkg                            v_alu_commit_pld        [INST_ALU_NUM-1    :0] ;

    // lsu ==================================================
    logic      [1                    :0]     v_stq_commit_en                 ;
    commit_pkg                               v_stq_commit_pld          [1:0]   ;
    logic      [3                    :0]     v_st_ack_commit_en              ;
    logic      [3                    :0]     v_st_ack_commit_cancel_en       ;
    logic      [$clog2(STU_DEPTH)-1  :0]     v_st_ack_commit_entry     [3:0]   ;
    logic      [2                    :0]     v_ldq_commit_en                 ;
    commit_pkg                               v_ldq_commit_pld          [2:0]   ;
    logic      [2                    :0]     v_lsu_fp_reg_wr_en              ;
    logic      [PHY_REG_ID_WIDTH-1   :0]     v_lsu_reg_index           [2:0]   ;
    logic      [2                    :0]     v_lsu_reg_wr_en                 ;
    logic      [REG_WIDTH-1          :0]     v_lsu_reg_val             [2:0]   ;
    
    // float ==================================================
    logic                      float_forward_rdy            ;
    commit_pkg                 fp_commit_pld                ;

    logic [PHY_REG_ID_WIDTH-1:0]float_reg_index             ;
    logic                       float_reg_wr_en              ;
    logic [REG_WIDTH-1:0]       float_reg_val                ;
    logic                       float_fp_reg_wr_en           ;
    logic [INST_IDX_WIDTH-1:0]  float_reg_inst_idx           ;
    logic                       float_inst_commit_en         ;

    // mext ==================================================
    logic      [INST_IDX_WIDTH-1:0]  mext_instruction_idx          ;
    logic                            mext_forward_rdy              ;
    logic      [PHY_REG_ID_WIDTH-1:0]mext_inst_rd_idx              ;
    logic                            mext_inst_rd_en               ;
    logic      [REG_WIDTH-1:0]       mext_rs1_val                  ;
    logic      [REG_WIDTH-1:0]       mext_rs2_val                  ;
    logic      [31:0]                mext_inst_imm                 ;
    logic      [ADDR_WIDTH-1:0]      mext_pc                       ;
    logic      [4:0]                 mext_arch_reg_index           ;
    commit_pkg                       mext_commit_pld               ;
    logic                            mext_c_ext                    ;
    logic      [PHY_REG_ID_WIDTH-1:0]mext_reg_index               ;
    logic                            mext_reg_wr_en                ;
    logic      [REG_WIDTH-1:0]       mext_reg_val                  ;
    logic      [INST_IDX_WIDTH-1:0]  mext_reg_inst_idx             ;
    logic                            mext_inst_commit_en           ;

    // csr ===================================================
    logic      [INST_IDX_WIDTH-1:0]  csr_instruction_idx           ;
    logic                            csr_instruction_is_intr       ;
    logic      [PHY_REG_ID_WIDTH-1:0]csr_inst_rd_idx              ;
    logic                            csr_inst_rd_en                ;
    logic      [REG_WIDTH-1:0]       csr_rs1_val                   ;
    logic      [REG_WIDTH-1:0]       csr_rs2_val                   ;
    logic      [ADDR_WIDTH-1:0]      csr_pc                        ;
    logic      [4:0]                 csr_arch_reg_index            ;
    logic      [31:0]                csr_inst_imm                  ;
    commit_pkg                       csr_commit_pld                ;
    logic                            csr_c_ext                     ;

    logic [PHY_REG_ID_WIDTH-1:0]csr_reg_index                ;
    logic                       csr_reg_wr_en                 ;
    logic [REG_WIDTH-1:0]       csr_reg_val                   ;
    logic [INST_IDX_WIDTH-1:0]  csr_reg_inst_idx              ;
    logic                       csr_inst_commit_en            ;

    logic      [63:0]                       csr_INSTRET                   ;
    logic      [31:0]                       csr_FCSR                      ;
    logic      [4:0]                        csr_FFLAGS                    ;
    logic                                   csr_FFLAGS_en                 ;
    logic                                   csr_intr_instruction_vld      ;
    logic                                   csr_intr_instruction_rdy      ;
    // commit
    logic                                   cancel_en                   ;
    logic                                   cancel_edge_en              ;
    logic                                   cancel_edge_en_d            ;
    logic      [ADDR_WIDTH-1         :0]    fetch_update_pc             ;
    logic      [COMMIT_REL_CHANNEL-1 :0]    v_rf_commit_en              ;
    logic                                   commit_credit_rel_en        ;
    logic      [2                  :0]      commit_credit_rel_num       ;
    commit_pkg                              v_rf_commit_pld          [COMMIT_REL_CHANNEL-1:0];
    logic      [COMMIT_REL_CHANNEL-1 :0]    v_commit_error_en ;
    be_pkg                                  v_bp_commit_pld          [COMMIT_REL_CHANNEL-1:0];
    logic      [7                   :0]     FCSR_backup;

//============================================================
// icache interface
//============================================================
    logic                                        prefetch_enable            ;
    logic [ICACHE_UPSTREAM_DATA_WIDTH-1 :0]      upstream_txdat_data        ;
    logic                                        upstream_txdat_vld         ;
    logic [ICACHE_REQ_TXNID_WIDTH-1     :0]      upstream_txdat_txnid       ;
    logic                                        upstream_txdat_rdy         ;
    logic                                        upstream_rxreq_vld         ;
    logic                                        upstream_rxreq_rdy         ;
    req_addr_t                                   upstream_rxreq_addr        ;
    logic [ICACHE_REQ_TXNID_WIDTH-1     :0]      upstream_rxreq_txnid       ;
    logic                                        downstream_rxsnp_vld       ;
    logic                                        downstream_rxsnp_rdy       ;
    pc_req_t                                     downstream_rxsnp_pld       ;
    logic                                        downstream_txreq_vld       ;
    logic                                        downstream_txreq_rdy       ;
    downstream_txreq_t                           downstream_txreq_pld       ;
    logic [MSHR_ENTRY_INDEX_WIDTH-1      :0]     downstream_txreq_entry_id  ;
    logic                                        downstream_txrsp_vld       ;
    logic                                        downstream_txrsp_rdy       ;
    logic [ICACHE_REQ_OPCODE_WIDTH-1     :0]     downstream_txrsp_opcode    ;
    logic                                        downstream_rxdat_vld       ;
    logic                                        downstream_rxdat_rdy       ;
    downstream_rxdat_t                           downstream_rxdat_pld       ;
    logic                                        prefetch_req_vld           ;
    pc_req_t                                     prefetch_req_pld           ;
    logic                                        pref_to_mshr_req_rdy       ;
//============================================================
// icache interface end
//============================================================
//============================================================
// icache 
//============================================================
    icache_top  u_icache_top (
        .clk                      (clk                    ),
        .rst_n                    (rst_n                  ),
        .prefetch_enable          (1'b0                   ),
        .upstream_txdat_data      (upstream_txdat_data    ),
        .upstream_txdat_vld       (upstream_txdat_vld     ),
        .upstream_txdat_rdy       (upstream_txdat_rdy     ),
        .upstream_txdat_txnid     (upstream_txdat_txnid   ),

        .upstream_rxreq_vld       (upstream_rxreq_vld     ),
        .upstream_rxreq_rdy       (upstream_rxreq_rdy     ),
        .upstream_rxreq_addr      (upstream_rxreq_addr    ),
        .upstream_rxreq_txnid     (upstream_rxreq_txnid   ),
        .downstream_rxsnp_vld     (1'b0                   ),
        .downstream_rxsnp_rdy     (                       ),
        .downstream_rxsnp_pld     ({$bits(pc_req_t){1'b0}}),
        .downstream_txreq_vld     (downstream_txreq_vld   ),
        .downstream_txreq_rdy     (downstream_txreq_rdy   ),
        .downstream_txreq_pld     (downstream_txreq_pld   ),
        .downstream_txreq_entry_id(downstream_txreq_entry_id),
        .downstream_txrsp_vld     (1'b1                   ),
        .downstream_txrsp_rdy     (                       ),
        .downstream_txrsp_opcode  (5'd2                   ),
        .downstream_rxdat_vld     (downstream_rxdat_vld   ),
        .downstream_rxdat_rdy     (downstream_rxdat_rdy   ),
        .downstream_rxdat_pld     (downstream_rxdat_pld   ),
        .prefetch_req_vld         (1'b0                   ),
        .prefetch_req_pld         ({$bits(pc_req_t){1'b0}}),
        .pref_to_mshr_req_rdy     (1'b0                   ));

//============================================================
// icache mem adapter
//============================================================
    icache_memory_adapter  u_icache_memory_adapter(
        .clk                            (clk                            ),
        .rst_n                          (rst_n                          ),
        .downstream_txreq_vld           (downstream_txreq_vld           ),
        .downstream_txreq_rdy           (downstream_txreq_rdy           ),
        .downstream_txreq_pld           (downstream_txreq_pld           ),
        .downstream_txreq_entry_id      (downstream_txreq_entry_id      ),
        .downstream_rxdat_vld           (downstream_rxdat_vld           ),
        .downstream_rxdat_rdy           (downstream_rxdat_rdy           ),
        .downstream_rxdat_pld           (downstream_rxdat_pld           ),
        .adapter_fetch_mem_req_vld      (fetch_mem_req_vld              ),
        .adapter_fetch_mem_req_rdy      (fetch_mem_req_rdy              ),
        .adapter_fetch_mem_req_addr     (fetch_mem_req_addr             ),
        .adapter_fetch_mem_req_entry_id (fetch_mem_req_entry_id         ),
        .adapter_fetch_mem_ack_vld      (fetch_mem_ack_vld              ),
        .adapter_fetch_mem_ack_rdy      (fetch_mem_ack_rdy              ),
        .adapter_fetch_mem_ack_data     (fetch_mem_ack_data             ),
        .adapter_fetch_mem_ack_entry_id (fetch_mem_ack_entry_id         )
    );
//=================icach end====================================


    toy_bpu u_bpu (
        .clk                (clk                   ),
        .rst_n              (rst_n                 ),
        .icache_req_vld     (upstream_rxreq_vld    ),
        .icache_req_rdy     (upstream_rxreq_rdy    ),
        .icache_req_entry_id(upstream_rxreq_txnid  ),
        .icache_req_addr    (upstream_rxreq_addr   ),
        .icache_ack_rdy     (upstream_txdat_rdy    ),
        .icache_ack_vld     (upstream_txdat_vld    ),
        .icache_ack_pld     (upstream_txdat_data   ),
        .icache_ack_entry_id(upstream_txdat_txnid  ),
        .fetch_queue_rdy    (fetch_queue_rdy       ),
        .fetch_queue_vld    (fetch_queue_vld       ),
        .fetch_queue_pld    (fetch_queue_pld       ),
        .fetch_queue_en     (fetch_queue_en        ),
        .be_commit_vld      (v_rf_commit_en        ),
        .be_commit_pld      (v_bp_commit_pld       ),
        .be_cancel_en       (cancel_en             ),
        .be_cancel_edge     (cancel_edge_en        ),
        .be_commit_error_en (v_commit_error_en     ),
        .be_cancel_pld      (v_bp_commit_pld       )
        );

    toy_fetch_queue2 #(
        .DEPTH(FETCH_QUEUE_DEPTH    )
    )u_fetch(
        .clk       (clk                      ),
        .rst_n     (rst_n                    ),
        .cancel_en (cancel_edge_en_d         ),
        .filter_rdy(fetch_queue_rdy          ),
        .filter_vld(fetch_queue_vld          ),
        .filter_pld(fetch_queue_pld          ),
        .filter_en (fetch_queue_en           ),
        .v_ack_vld (v_fetched_instruction_vld),
        .v_ack_rdy (v_fetched_instruction_rdy),
        .v_ack_pc  (v_fetched_instruction_pc ),
        .v_ack_pld (v_fetched_instruction_pld),
        .v_ack_idx (v_fetched_instruction_idx),
        .v_fe_pld  (v_inst_fe_pld            ),
        .commit_credit_rel_en(commit_credit_rel_en),
        .commit_credit_rel_num(commit_credit_rel_num)
        );
    // decode
    logic [INST_DECODE_NUM-1   :0]     v_decode_vld;
    logic [INST_DECODE_NUM-1   :0]     v_decode_rdy;
    decode_pkg                         v_decode_pld       [INST_DECODE_NUM-1:0];

    toy_decoder_top u_toy_decoder_top(
        .clk                        (clk                        ),
        .rst_n                      (rst_n                      ),
        .v_fetched_instruction_vld  (v_fetched_instruction_vld  ),
        .v_fetched_instruction_rdy  (v_fetched_instruction_rdy  ),
        .v_fetched_instruction_pld  (v_fetched_instruction_pld  ),
        .v_fetched_instruction_pc   (v_fetched_instruction_pc   ),
        .v_fetched_instruction_idx  (v_fetched_instruction_idx  ),
        .v_fe_bypass_pld            (v_inst_fe_pld              ),
        .v_decode_vld               (v_decode_vld               ),
        .v_decode_rdy               (v_decode_rdy               ),
        .v_decode_pld               (v_decode_pld               ),
        .csr_intr_instruction_vld   (csr_intr_instruction_vld   ),
        .csr_intr_instruction_rdy   (csr_intr_instruction_rdy   )
    );
    // rename 
    logic   [INST_DECODE_NUM-1   :0]     v_int_pre_allocate_vld ;
    logic   [INST_DECODE_NUM-1   :0]     v_int_pre_allocate_rdy ;
    logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_pre_allocate_id  [INST_DECODE_NUM-1:0];
    logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_allocate_vld  ;
    logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_allocate_rdy  ;
    logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_pre_allocate_id   [INST_DECODE_NUM-1:0];
    logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_backup_phy_id    [ARCH_ENTRY_NUM-1 :0];
    logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_backup_phy_id     [ARCH_ENTRY_NUM-1 :0];
    logic   [INST_DECODE_NUM-1   :0]     v_rename_vld           ;
    logic   [INST_DECODE_NUM-1   :0]     v_rename_rdy           ;
    rename_pkg                           v_rename_pld           [INST_DECODE_NUM-1:0];
    toy_rename u_toy_rename(
        .clk                                (clk                    ), 
        .rst_n                              (rst_n                  ), 
        .v_pre_allocate_int_vld             (v_int_pre_allocate_vld ), 
        .v_pre_allocate_int_rdy_withoutzero (v_int_pre_allocate_rdy ),
        .v_pre_allocate_int_id              (v_int_pre_allocate_id  ), 
        .v_pre_allocate_fp_vld              (v_fp_pre_allocate_vld  ), 
        .v_pre_allocate_fp_rdy              (v_fp_pre_allocate_rdy  ), 
        .v_pre_allocate_fp_id               (v_fp_pre_allocate_id   ), 
        .v_decode_vld                       (v_decode_vld           ), 
        .v_decode_rdy                       (v_decode_rdy           ), 
        .v_decode_pld                       (v_decode_pld           ), 
        .cancel_en                          (cancel_en              ), 
        .cancel_edge_en_d                   (cancel_edge_en_d       ), 
        .v_int_backup_phy_id                (v_int_backup_phy_id    ), 
        .v_fp_backup_phy_id                 (v_fp_backup_phy_id     ), 
        .v_rename_vld                       (v_rename_vld           ), 
        .v_rename_rdy                       (v_rename_rdy           ), 
        .v_rename_pld                       (v_rename_pld           )
    );
    //inst BUFFER
    logic [OOO_DEPTH-1       :0]         v_issue_buffer_vld ;          
    logic [OOO_DEPTH-1       :0]         v_issue_buffer_rdy ;         
    rename_pkg                           v_issue_buffer_pld [OOO_DEPTH-1  :0];

    toy_issue_buffer 
    u_toy_dispatch_issue_buffer(
        .clk            (clk                ),
        .rst_n          (rst_n              ),
        .v_s_vld        (v_rename_vld       ),
        .v_s_rdy        (v_rename_rdy       ),
        .v_s_pld        (v_rename_pld       ),
        .v_m_vld        (v_issue_buffer_vld ),
        .v_m_rdy        (v_issue_buffer_rdy ),
        .v_m_pld        (v_issue_buffer_pld ),
        .cancel_edge_en (cancel_edge_en_d   )
    );
    //issue hazard
    logic                                float_instruction_rdy       ;
    logic                                mext_instruction_rdy        ;
    logic [EU_NUM-1              :0]     v_int_wr_en                 ;
    logic [EU_NUM-1              :0]     v_fp_wr_en                  ;
    logic [PHY_REG_ID_WIDTH-1    :0]     v_wr_reg_index              [EU_NUM-1           :0];
    logic [REG_WIDTH-1           :0]     v_wr_reg_data               [EU_NUM-1           :0];
    logic [EU_NUM-1              :0]     v_int_wr_forward_en         ;
    logic [EU_NUM-1              :0]     v_fp_wr_forward_en          ;
    logic [PHY_REG_ID_WIDTH-1    :0]     v_wr_reg_forward_index      [EU_NUM-1           :0];
    logic [OOO_DEPTH-1           :0]     v_inst_vld                  ;
    logic [OOO_DEPTH-1           :0]     v_inst_rdy                  ;
    rename_pkg                           v_inst_pld                  [OOO_DEPTH-1        :0];
    logic [OOO_DEPTH-1           :0]     v_issue_en                  ;
    issue_pkg                            v_issue_pld                 [OOO_DEPTH-1        :0];
    logic [$clog2(LSU_DEPTH)     :0]     lsu_buffer_rd_ptr           ;
    
    assign float_instruction_rdy = float_forward_rdy;
    assign mext_instruction_rdy  = mext_forward_rdy;
    toy_issue u_toy_issue(
        .clk                        (clk                    ),
        .rst_n                      (rst_n                  ),
        .v_int_wr_en                (v_int_wr_en            ),
        .v_fp_wr_en                 (v_fp_wr_en             ),
        .v_wr_reg_index             (v_wr_reg_index         ),
        .v_wr_reg_data              (v_wr_reg_data          ),
        .v_int_wr_forward_en        (v_int_wr_forward_en    ),
        .v_fp_wr_forward_en         (v_fp_wr_forward_en     ),
        .v_wr_reg_forward_index     (v_wr_reg_forward_index ),
        .v_commit_en                (v_rf_commit_en         ),
        .v_commit_pld               (v_rf_commit_pld        ),
        .cancel_en                  (cancel_en              ),
        .cancel_edge_en             (cancel_edge_en_d       ),
        .v_inst_vld                 (v_issue_buffer_vld     ),
        .v_inst_rdy                 (v_issue_buffer_rdy     ),
        .v_inst_pld                 (v_issue_buffer_pld     ),
        .v_int_backup_phy_id        (v_int_backup_phy_id    ),
        .v_fp_backup_phy_id         (v_fp_backup_phy_id     ),
        .float_instruction_rdy      (float_instruction_rdy  ),
        .mext_instruction_rdy       (mext_instruction_rdy   ),
        .lsu_buffer_rd_ptr          (lsu_buffer_rd_ptr      ),
        .v_issue_en                 (v_issue_en             ),
        .v_issue_pld                (v_issue_pld            ),
        .v_int_pre_allocate_vld     (v_int_pre_allocate_vld ),
        .v_int_pre_allocate_rdy     (v_int_pre_allocate_rdy ),
        .v_int_pre_allocate_id      (v_int_pre_allocate_id  ),
        .v_fp_pre_allocate_vld      (v_fp_pre_allocate_vld  ),
        .v_fp_pre_allocate_rdy      (v_fp_pre_allocate_rdy  ),
        .v_fp_pre_allocate_id       (v_fp_pre_allocate_id   )
    );
    // dispatch 
    logic [3                     :0]     v_lsu_instruction_vld      ;
    lsu_pkg                              v_lsu_pld       [3:0]      ;
    logic [INST_ALU_NUM-1        :0]     v_alu_instruction_vld      ; 
    eu_pkg                               v_alu_instruction_pld      [INST_ALU_NUM-1    :0]      ;
    logic                                mext_instruction_vld       ;
    eu_pkg                               mext_instruction_pld       ;
    logic                                float_instruction_vld      ;
    eu_pkg                               float_instruction_pld      ;
    logic                                csr_instruction_vld        ;
    eu_pkg                               csr_instruction_pld        ; 
    eu_pkg                               custom_instruction_ply     ;
    
    assign custom_instruction_pld = custom_instruction_ply.inst_pld;
    
    toy_dispatch u_toy_dispatch(
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        .v_issue_en             (v_issue_en             ),
        .v_issue_pld            (v_issue_pld            ),
        .v_lsu_instruction_vld  (v_lsu_instruction_vld  ),
        .v_lsu_pld              (v_lsu_pld              ),
        .v_alu_instruction_vld  (v_alu_instruction_vld  ),
        .v_alu_instruction_pld  (v_alu_instruction_pld  ),
        .mext_instruction_vld   (mext_instruction_vld   ),
        .mext_instruction_pld   (mext_instruction_pld   ),
        .float_instruction_vld  (float_instruction_vld  ),
        .float_instruction_pld  (float_instruction_pld  ),
        .custom_instruction_vld (custom_instruction_vld ),
        .custom_instruction_pld (custom_instruction_ply ),
        .csr_instruction_vld    (csr_instruction_vld    ),
        .csr_instruction_pld    (csr_instruction_pld    )
    );
    // forward
    logic [REG_WIDTH-1           :0]     v_forward_data         [EU_NUM-1          :0]      ;
    // alu 
    logic [INST_ALU_NUM-1        :0]     v_alu_forward_vld      ; 
    forward_pkg                          v_alu_forward_pld      [INST_ALU_NUM-1    :0]      ;
    logic [INST_ALU_NUM-1        :0]     v_alu_reg_wr_forward_en;
    logic [PHY_REG_ID_WIDTH-1    :0]     v_alu_reg_forward_index[INST_ALU_NUM-1    :0]      ;
    generate
        for (genvar i=0;i<INST_ALU_NUM;i=i+1)begin : ALU_INST

        assign v_alu_reg_wr_forward_en[i] = v_alu_instruction_vld[i] && v_alu_instruction_pld[i].inst_rd_en;
        assign v_alu_reg_forward_index[i] = v_alu_instruction_pld[i].inst_rd;


            toy_eu_forward_mux u_toy_alu_forward_mux(
                .clk            (clk                      ),
                .rst_n          (rst_n                    ),
                .v_forward_data (v_forward_data           ),
                .cancel_en      (cancel_en                ),
                .eu_en          (v_alu_instruction_vld[i] ),
                .eu_pld         (v_alu_instruction_pld[i] ),
                .forward_en     (v_alu_forward_vld[i]     ),
                .forward_pld    (v_alu_forward_pld[i]     )
            );

            toy_alu u_alu(
                .clk                        (clk                             ),
                .rst_n                      (rst_n                           ),
                .instruction_vld            (v_alu_forward_vld[i]            ),
                .instruction_rdy            (                                ),// no use todo
                .instruction_pld            (v_alu_forward_pld[i]            ),
                .reg_inst_idx               (v_alu_reg_inst_idx[i]           ),
                .reg_index                  (v_alu_reg_index[i]              ),
                .reg_wr_en                  (v_alu_reg_wr_en[i]              ),
                .reg_data                   (v_alu_reg_val[i]                ),
                .inst_commit_en             (v_alu_inst_commit_en[i]         ),
                .alu_commit_pld             (v_alu_commit_pld[i]             ),
                .pc_release_en              (v_jb_pc_release_en[i]           ),
                .pc_update_en               (v_jb_pc_update_en[i]            ),
                .pc_val                     (v_jb_pc_val[i]                  ));
        end
    endgenerate
    // no use ??? todo
    assign jb_pc_release_en = | v_jb_pc_release_en            ;         
    assign jb_pc_update_en  = | v_jb_pc_update_en             ;
    assign jb_pc_val        =  v_jb_pc_update_en[0] ? v_jb_pc_val[0] :
                        v_jb_pc_update_en[1] ? v_jb_pc_val[1] :
                        v_jb_pc_update_en[2] ? v_jb_pc_val[2] : 
                                               v_jb_pc_val[3] ;


    toy_lsu u_toy_lsu(
        .clk                        (clk                        ),
        .rst_n                      (rst_n                      ),
        .v_instruction_vld          (v_lsu_instruction_vld      ),
        .v_lsu_pld                  (v_lsu_pld                  ),
        .lsu_buffer_rd_ptr          (lsu_buffer_rd_ptr          ),
        .v_forward_data             (v_forward_data             ),
        .reg_index                  (v_lsu_reg_index            ),
        .reg_wr_en                  (v_lsu_reg_wr_en            ),
        .reg_val                    (v_lsu_reg_val              ),
        .fp_reg_wr_en               (v_lsu_fp_reg_wr_en         ),
        .v_stq_commit_en            (v_stq_commit_en            ),
        .v_stq_commit_pld           (v_stq_commit_pld           ),      
        .v_st_ack_commit_en         (v_st_ack_commit_en         ),         
        .v_st_ack_commit_cancel_en  (v_st_ack_commit_cancel_en  ),      
        .v_st_ack_commit_entry      (v_st_ack_commit_entry      ),  
        .v_ldq_commit_en            (v_ldq_commit_en            ),        
        .v_ldq_commit_pld           (v_ldq_commit_pld           ),   
        .cancel_en                  (cancel_en                  ),
        .cancel_edge_en             (cancel_edge_en_d           ),   
        .mem_req_vld                (lsu_mem_req_vld            ),
        .mem_req_rdy                (lsu_mem_req_rdy            ),
        .mem_req_addr               (lsu_mem_req_addr           ),
        .mem_req_data               (lsu_mem_req_data           ),
        .mem_req_strb               (lsu_mem_req_strb           ),
        .mem_req_opcode             (lsu_mem_req_opcode         ),
        .mem_req_sideband           (lsu_mem_req_sideband       ),
        .mem_ack_sideband           (lsu_mem_ack_sideband       ),
        .mem_ack_vld                (lsu_mem_ack_vld            ),
        .mem_ack_rdy                (lsu_mem_ack_rdy            ),
        .mem_ack_data               (lsu_mem_ack_data           ));
    // fp 
    logic                                float_forward_vld      ; 
    forward_pkg                          float_forward_pld      ;
    logic                                float_fp_reg_wr_forward_en;
    logic                                float_reg_wr_forward_en;
    logic [PHY_REG_ID_WIDTH-1    :0]     fp_reg_forward_index;
    toy_eu_forward_mux u_toy_fp_forward_mux(
        .clk            (clk                      ),
        .rst_n          (rst_n                    ),
        .v_forward_data (v_forward_data           ),
        .cancel_en      (cancel_en                ),
        .eu_en          (float_instruction_vld    ),
        .eu_pld         (float_instruction_pld    ),
        .forward_en     (float_forward_vld        ),
        .forward_pld    (float_forward_pld        )
    );
    toy_float_wrapper u_float(
        .clk                        (clk                        ),
        .rst_n                      (rst_n                      ),
        .instruction_vld            (float_forward_vld          ),
        .instruction_rdy            (float_forward_rdy          ),
        .instruction_pld            (float_forward_pld          ),
        .csr_FCSR                   (csr_FCSR                   ),
        .csr_FFLAGS                 (csr_FFLAGS                 ),
        .csr_FFLAGS_en              (csr_FFLAGS_en              ),
        .float_reg_wr_forward_en    (float_reg_wr_forward_en    ),
        .float_fp_reg_wr_forward_en (float_fp_reg_wr_forward_en ),
        .fp_reg_forward_index       (fp_reg_forward_index       ),
        .fp_commit_pld              (fp_commit_pld              ),
        .reg_index                  (float_reg_index            ),
        .reg_wr_en                  (float_reg_wr_en            ),
        .reg_val                    (float_reg_val              ),
        .fp_reg_wr_en               (float_fp_reg_wr_en         ),
        .reg_inst_idx               (float_reg_inst_idx         ),
        .inst_commit_en             (float_inst_commit_en       ));
    // mext
    logic                                mext_forward_vld      ; 
    forward_pkg                          mext_forward_pld      ;
    logic                                mext_reg_wr_forward_en;
    logic [PHY_REG_ID_WIDTH-1    :0]     mext_reg_forward_index;
    toy_eu_forward_mux u_toy_mext_forward_mux(
        .clk            (clk                      ),
        .rst_n          (rst_n                    ),
        .v_forward_data (v_forward_data           ),
        .cancel_en      (cancel_en                ),
        .eu_en          (mext_instruction_vld     ),
        .eu_pld         (mext_instruction_pld     ),
        .forward_en     (mext_forward_vld         ),
        .forward_pld    (mext_forward_pld         )
    );
    toy_mext u_mext(
        .clk                        (clk                        ),
        .rst_n                      (rst_n                      ),
        .instruction_vld            (mext_forward_vld           ),
        .instruction_rdy            (                           ), // no use todo
        .instruction_pld            (mext_forward_pld           ),
        .instruction_forward_rdy    (mext_forward_rdy           ),
        .cancel_en                  (cancel_en                  ),
        .mext_reg_wr_forward_en     (mext_reg_wr_forward_en     ),
        .mext_reg_forward_index     (mext_reg_forward_index     ),
        .mext_commit_pld            (mext_commit_pld            ),
        .reg_index                  (mext_reg_index             ),
        .reg_wr_en                  (mext_reg_wr_en             ),
        .reg_val                    (mext_reg_val               ),
        .reg_inst_idx               (mext_reg_inst_idx          ),
        .inst_commit_en             (mext_inst_commit_en        ));
    // csr
    logic                                csr_forward_vld      ; 
    forward_pkg                          csr_forward_pld      ;
    logic                                csr_reg_wr_forward_en;
    logic [PHY_REG_ID_WIDTH-1    :0]     csr_reg_forward_index;
    assign csr_reg_wr_forward_en = csr_instruction_vld && csr_instruction_pld.inst_rd_en;
    assign csr_reg_forward_index = csr_instruction_pld.inst_rd;
    toy_eu_forward_mux u_toy_csr_forward_mux(
        .clk            (clk                      ),
        .rst_n          (rst_n                    ),
        .v_forward_data (v_forward_data           ),
        .cancel_en      (cancel_en                ),
        .eu_en          (csr_instruction_vld      ),
        .eu_pld         (csr_instruction_pld      ),
        .forward_en     (csr_forward_vld          ),
        .forward_pld    (csr_forward_pld          )
    );
    toy_csr u_csr(
        .clk                        (clk                        ),
        .rst_n                      (rst_n                      ),
        .intr_instruction_vld       (csr_intr_instruction_vld   ),
        .intr_instruction_rdy       (csr_intr_instruction_rdy   ),

        .instruction_vld            (csr_forward_vld            ),
        .instruction_rdy            (csr_forward_rdy            ), //no use todo
        .instruction_pld            (csr_forward_pld            ),
        .instruction_is_intr        (csr_instruction_is_intr    ),
        .reg_index                  (csr_reg_index              ),
        .reg_wr_en                  (csr_reg_wr_en              ),
        .reg_val                    (csr_reg_val                ),
        .reg_inst_idx               (csr_reg_inst_idx           ),
        .inst_commit_en             (csr_inst_commit_en         ),
        .csr_commit_pld             (csr_commit_pld             ),
        .csr_INSTRET                (csr_INSTRET                ),
        .cancel_edge_en             (cancel_edge_en_d           ),
        .FCSR_backup                (FCSR_backup                ),
        .csr_FCSR                   (csr_FCSR                   ),
        .csr_FFLAGS                 (csr_FFLAGS                 ),
        .csr_FFLAGS_en              (csr_FFLAGS_en              ),
        .pc_release_en              (trap_pc_release_en         ),
        .pc_update_en               (trap_pc_update_en          ),
        .pc_val                     (trap_pc_val                ),
        .intr_meip                  (intr_meip                  ),
        .intr_msip                  (intr_msip                  ));
    // wb
    //=================================================
    // todo lsu forward
    //=================================================
    logic [PHY_REG_ID_WIDTH-1    :0]     v_lsu_reg_forward_index     [2                  :0];
    assign v_lsu_reg_forward_index[0] = {PHY_REG_ID_WIDTH{1'b0}};
    assign v_lsu_reg_forward_index[1] = {PHY_REG_ID_WIDTH{1'b0}};
    assign v_lsu_reg_forward_index[2] = {PHY_REG_ID_WIDTH{1'b0}};
    //=================================================
    toy_wb u_toy_wb(
        .clk                            (clk                            ), 
        .rst_n                          (rst_n                          ), 
        .v_lsu_reg_wr_en                (v_lsu_reg_wr_en                ), 
        .v_lsu_reg_wr_forward_en        (3'b0                           ), //todo lsu do not forward 
        .v_lsu_fp_reg_wr_en             (v_lsu_fp_reg_wr_en             ), 
        .v_lsu_fp_reg_wr_forward_en     (3'b0                           ), //todo lsu do not forward 
        .v_lsu_reg_val                  (v_lsu_reg_val                  ), 
        .v_lsu_reg_index                (v_lsu_reg_index                ), 
        .v_lsu_reg_forward_index        (v_lsu_reg_forward_index        ), //todo lsu do not forward 
        .v_alu_reg_wr_en                (v_alu_reg_wr_en                ), 
        .v_alu_reg_wr_forward_en        (v_alu_reg_wr_forward_en        ), 
        .v_alu_reg_index                (v_alu_reg_index                ), 
        .v_alu_reg_forward_index        (v_alu_reg_forward_index        ), 
        .v_alu_reg_val                  (v_alu_reg_val                  ), 
        .mext_reg_index                 (mext_reg_index                 ), 
        .mext_reg_forward_index         (mext_reg_forward_index         ), 
        .mext_reg_wr_en                 (mext_reg_wr_en                 ), 
        .mext_reg_wr_forward_en         (mext_reg_wr_forward_en         ), 
        .mext_reg_val                   (mext_reg_val                   ), 
        .float_reg_index                (float_reg_index                ), 
        .float_reg_forward_index        (fp_reg_forward_index           ), 
        .float_reg_wr_en                (float_reg_wr_en                ), 
        .float_reg_wr_forward_en        (float_reg_wr_forward_en        ), 
        .float_fp_reg_wr_en             (float_fp_reg_wr_en             ), 
        .float_fp_reg_wr_forward_en     (float_fp_reg_wr_forward_en     ), 
        .float_reg_val                  (float_reg_val                  ), 
        .csr_reg_index                  (csr_reg_index                  ), 
        .csr_reg_forward_index          (csr_reg_forward_index          ), 
        .csr_reg_wr_en                  (csr_reg_wr_en                  ), 
        .csr_reg_wr_forward_en          (csr_reg_wr_forward_en          ), 
        .csr_reg_val                    (csr_reg_val                    ), 
        .v_forward_data                 (v_forward_data                 ), 
        .v_int_wr_en                    (v_int_wr_en                    ), 
        .v_fp_wr_en                     (v_fp_wr_en                     ), 
        .v_wr_reg_index                 (v_wr_reg_index                 ), 
        .v_wr_reg_data                  (v_wr_reg_data                  ), 
        .v_int_wr_forward_en            (v_int_wr_forward_en            ), 
        .v_fp_wr_forward_en             (v_fp_wr_forward_en             ), 
        .v_wr_reg_forward_index         (v_wr_reg_forward_index         )
    );


    //commit
    toy_commit u_toy_commit(

        .clk                        (clk                          ),
        .rst_n                      (rst_n                        ),
        .v_alu_commit_en            (v_alu_inst_commit_en         ),
        .v_alu_commit_pld           (v_alu_commit_pld             ),
        .v_stq_commit_en            (v_stq_commit_en              ),
        .v_stq_commit_pld           (v_stq_commit_pld             ),
        .v_st_ack_commit_en         (v_st_ack_commit_en           ),
        .v_st_ack_commit_entry      (v_st_ack_commit_entry        ),
        .v_ldq_commit_en            (v_ldq_commit_en              ),
        .v_ldq_commit_pld           (v_ldq_commit_pld             ),
        .fp_commit_en               (float_inst_commit_en         ),
        .fp_commit_pld              (fp_commit_pld                ),
        .mext_commit_en             (mext_inst_commit_en          ),
        .mext_commit_pld            (mext_commit_pld              ),
        .csr_commit_en              (csr_inst_commit_en           ),
        .csr_commit_pld             (csr_commit_pld               ),
        .v_instruction_vld          (v_fetched_instruction_vld    ),
        .v_instruction_rdy          (v_fetched_instruction_rdy    ),
        .v_instruction_pc           (v_fetched_instruction_pc     ),
        .v_instruction_idx          (v_fetched_instruction_idx    ),
        .v_inst_fe_pld              (v_inst_fe_pld                ),
        .cancel_en                  (cancel_en                    ),
        .cancel_edge_en             (cancel_edge_en               ),
        .cancel_edge_en_d           (cancel_edge_en_d             ),
        .FCSR_backup                (FCSR_backup                  ),
        // .fetch_update_pc            (fetch_update_pc              ),
        .v_rf_commit_en             (v_rf_commit_en               ), //commit en
        .v_rf_commit_pld            (v_rf_commit_pld              ),
        .v_commit_error_en          (v_commit_error_en            ), //todo for tao
        .v_bp_commit_pld            (v_bp_commit_pld              ), //todo for tao
        .csr_INSTRET                (csr_INSTRET                  ),
        .commit_credit_rel_en       (commit_credit_rel_en         ),
        .commit_credit_rel_num      (commit_credit_rel_num        )

        );





endmodule