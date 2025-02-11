
module toy_issue
    import toy_pack::*;
(
    input  logic                                clk                         ,
    input  logic                                rst_n                       ,

    // wr back status
    input  logic [EU_NUM-1              :0]     v_int_wr_en                 ,
    input  logic [EU_NUM-1              :0]     v_fp_wr_en                  ,
    input  logic [PHY_REG_ID_WIDTH-1    :0]     v_wr_reg_index              [EU_NUM-1           :0],
    input  logic [REG_WIDTH-1           :0]     v_wr_reg_data               [EU_NUM-1           :0],
    // wr back forward status
    input  logic [EU_NUM-1              :0]     v_int_wr_forward_en         ,
    input  logic [EU_NUM-1              :0]     v_fp_wr_forward_en          ,
    input  logic [PHY_REG_ID_WIDTH-1    :0]     v_wr_reg_forward_index      [EU_NUM-1           :0],
    // commit 
    input  logic [COMMIT_REL_CHANNEL-1  :0]     v_commit_en                 ,
    input  commit_pkg                           v_commit_pld                [COMMIT_REL_CHANNEL-1:0],
    input  logic                                cancel_en                   ,          
    input  logic                                cancel_edge_en              ,
    // inst input
    input  logic [OOO_DEPTH-1           :0]     v_inst_vld                  ,
    output logic [OOO_DEPTH-1           :0]     v_inst_rdy                  ,
    input  rename_pkg                           v_inst_pld                  [OOO_DEPTH-1        :0],
    // backup rename table 
    output logic [PHY_REG_ID_WIDTH-1    :0]     v_int_backup_phy_id        [ARCH_ENTRY_NUM-1   :0],
    output logic [PHY_REG_ID_WIDTH-1    :0]     v_fp_backup_phy_id         [ARCH_ENTRY_NUM-1   :0],
    // fp ready
    input  logic                                float_instruction_rdy       ,
    input  logic                                mext_instruction_rdy        ,
    // lsu ready ptr
    input  logic [$clog2(LSU_DEPTH)     :0]     lsu_buffer_rd_ptr           ,
    // issue output
    output logic [OOO_DEPTH-1           :0]     v_issue_en                  ,
    output issue_pkg                            v_issue_pld                 [OOO_DEPTH-1        :0],
    // pre alloc 
    output logic   [INST_DECODE_NUM-1   :0]     v_int_pre_allocate_vld      , //buffer pre output
    input  logic   [INST_DECODE_NUM-1   :0]     v_int_pre_allocate_rdy      ,
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_pre_allocate_id       [INST_DECODE_NUM-1:0] ,
    output logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_allocate_vld       ,
    input  logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_allocate_rdy       ,
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_pre_allocate_id        [INST_DECODE_NUM-1:0] 


);


    //##############################################
    // backup phy rf status  
    //############################################## 

    logic   [PHY_REG_NUM-1      :0]     v_int_phy_release           ;
    logic   [PHY_REG_NUM-1      :0]     v_int_phy_back_ref          ;
    logic   [PHY_REG_NUM-1      :0]     v_int_phy_release_comb      ; 

    logic   [PHY_REG_NUM-1      :0]     v_fp_phy_release            ;
    logic   [PHY_REG_NUM-1      :0]     v_fp_phy_back_ref           ;
    logic   [PHY_REG_NUM-1      :0]     v_fp_phy_release_comb       ;

    logic   [OOO_DEPTH-1        :0]     v_raw_int_cycle_not_lock    ;
    logic   [OOO_DEPTH-1        :0]     v_raw_fp_cycle_not_lock     ;
    logic   [OOO_DEPTH-1        :0]     v_int_rs1_rdy               ;
    logic   [OOO_DEPTH-1        :0]     v_int_rs2_rdy               ;
    logic   [OOO_DEPTH-1        :0]     v_fp_rs1_rdy                ;
    logic   [OOO_DEPTH-1        :0]     v_fp_rs2_rdy                ;
    logic   [OOO_DEPTH-1        :0]     v_fp_rs3_rdy                ;
    logic   [OOO_DEPTH-1        :0]     v_int_rs1_raw               ;
    logic   [OOO_DEPTH-1        :0]     v_int_rs2_raw               ;
    logic   [OOO_DEPTH-1        :0]     v_fp_rs1_raw                ;
    logic   [OOO_DEPTH-1        :0]     v_fp_rs2_raw                ;
    logic   [OOO_DEPTH-1        :0]     v_fp_rs3_raw                ;
    logic   [OOO_DEPTH-1        :0]     v_int_not_lock              ;
    logic   [OOO_DEPTH-1        :0]     v_fp_not_lock               ;
    logic   [OOO_DEPTH-1        :0]     v_unit_not_lock             ;
    logic   [OOO_DEPTH-1        :0]     v_fp_csr_not_lock           ;
    logic   [OOO_DEPTH-1        :0]     v_mext_not_lock             ;
    logic   [OOO_DEPTH-1        :0]     v_lsu_not_lock              ;
    logic   [INST_DECODE_NUM-1  :0]     v_phy_int_rs1_en            ;
    logic   [INST_DECODE_NUM-1  :0]     v_phy_int_rs2_en            ;
    
    logic   [OOO_DEPTH-1        :0]     v_csr_mask                  [OOO_DEPTH-1        :0];
    logic   [1                  :0]     v_goto_unit_previous        [OOO_DEPTH-1        :0];
    logic   [1                  :0]     v_goto_unit                 [OOO_DEPTH-1        :0];
    logic   [FORWARD_NUM-1      :0]     v_int_rs1_forward           [INST_DECODE_NUM-1  :0];
    logic   [FORWARD_NUM-1      :0]     v_int_rs2_forward           [INST_DECODE_NUM-1  :0];
    logic   [FORWARD_NUM-1      :0]     v_fp_rs1_forward            [INST_DECODE_NUM-1  :0];
    logic   [FORWARD_NUM-1      :0]     v_fp_rs2_forward            [INST_DECODE_NUM-1  :0];
    logic   [FORWARD_NUM-1      :0]     v_fp_rs3_forward            [INST_DECODE_NUM-1  :0];
    logic   [EU_NUM_WIDTH-1     :0]     v_int_rs1_forward_id        [INST_DECODE_NUM-1  :0];
    logic   [EU_NUM_WIDTH-1     :0]     v_int_rs2_forward_id        [INST_DECODE_NUM-1  :0];
    logic   [EU_NUM_WIDTH-1     :0]     v_fp_rs1_forward_id         [INST_DECODE_NUM-1  :0];
    logic   [EU_NUM_WIDTH-1     :0]     v_fp_rs2_forward_id         [INST_DECODE_NUM-1  :0];
    logic   [EU_NUM_WIDTH-1     :0]     v_fp_rs3_forward_id         [INST_DECODE_NUM-1  :0];
    logic   [REG_WIDTH-1        :0]     v_reg_rs1_data              [INST_DECODE_NUM-1  :0];
    logic   [REG_WIDTH-1        :0]     v_reg_rs2_data              [INST_DECODE_NUM-1  :0];
    logic   [REG_WIDTH-1        :0]     v_reg_rs3_data              [INST_DECODE_NUM-1  :0];
    logic   [PHY_REG_ID_WIDTH-1 :0]     v_phy_reg_rs1_index         [INST_DECODE_NUM-1  :0];
    logic   [PHY_REG_ID_WIDTH-1 :0]     v_phy_reg_rs2_index         [INST_DECODE_NUM-1  :0];
    logic   [PHY_REG_ID_WIDTH-1 :0]     v_phy_reg_rs3_index         [INST_DECODE_NUM-1  :0];



    toy_backup_rename_regfile_top u_toy_backup_rename_regfile_top(

        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        .v_commit_en            (v_commit_en            ),
        .v_commit_pld           (v_commit_pld           ),
        .v_int_phy_release      (v_int_phy_release      ),
        .v_int_phy_back_ref     (v_int_phy_back_ref     ),
        .v_int_phy_release_comb (v_int_phy_release_comb ),
        .v_int_backup_phy_id    (v_int_backup_phy_id    ),
        .v_fp_phy_release       (v_fp_phy_release       ),
        .v_fp_phy_back_ref      (v_fp_phy_back_ref      ),
        .v_fp_phy_release_comb  (v_fp_phy_release_comb  ),
        .v_fp_backup_phy_id     (v_fp_backup_phy_id     )

    );

    //##############################################
    // phy rf data  
    //############################################## 
    generate
        for(genvar i=0;i<OOO_DEPTH;i=i+1)begin
            assign v_phy_int_rs1_en[i] = v_inst_pld[i].use_rs1_en;
            assign v_phy_int_rs2_en[i] = v_inst_pld[i].use_rs2_en;

            assign v_phy_reg_rs1_index[i] = v_inst_pld[i].phy_rs1;
            assign v_phy_reg_rs2_index[i] = v_inst_pld[i].phy_rs2;
            assign v_phy_reg_rs3_index[i] = v_inst_pld[i].phy_rs3;
        end
    endgenerate

    toy_physicial_regfile_data u_toy_physicial_regfile_data(
        .clk                    (clk                    ),
        .rst_n                  (rst_n                  ),
        .v_int_wr_en            (v_int_wr_en            ),
        .v_fp_wr_en             (v_fp_wr_en             ),
        .v_wr_reg_index         (v_wr_reg_index         ),
        .v_wr_reg_data          (v_wr_reg_data          ),
        .v_phy_reg_rs1_index    (v_phy_reg_rs1_index    ),
        .v_phy_reg_rs2_index    (v_phy_reg_rs2_index    ),
        .v_phy_reg_rs3_index    (v_phy_reg_rs3_index    ),
        .v_phy_int_rs1_en       (v_phy_int_rs1_en       ),
        .v_phy_int_rs2_en       (v_phy_int_rs2_en       ),
        .v_reg_rs1_data         (v_reg_rs1_data         ),
        .v_reg_rs2_data         (v_reg_rs2_data         ),
        .v_reg_rs3_data         (v_reg_rs3_data         )
    );

    //##############################################
    // phy rf status
    //############################################## 
    // toy_pre_alloc_buffer u_fp_pre_alloc_buffer(
    //     .clk                (clk                     ),
    //     .rst_n              (rst_n                   ),
    //     .v_s_vld            (v_fp_pre_allocate_vld   ),
    //     .v_s_rdy            (v_fp_pre_allocate_rdy   ),
    //     .v_s_pld            (v_fp_pre_allocate_id    ),
    //     .v_m_vld            (v_bf_fp_pre_allocate_vld),
    //     .v_m_rdy            (v_bf_fp_pre_allocate_rdy),
    //     .v_m_pld            (v_bf_fp_pre_allocate_id ),
    //     .cancel_edge_en     (cancel_edge_en          )
    // );

    // toy_pre_alloc_buffer u_int_pre_alloc_buffer(
    //     .clk                (clk                      ),
    //     .rst_n              (rst_n                    ),
    //     .v_s_vld            (v_int_pre_allocate_vld   ),
    //     .v_s_rdy            (v_int_pre_allocate_rdy   ),
    //     .v_s_pld            (v_int_pre_allocate_id    ),
    //     .v_m_vld            (v_bf_int_pre_allocate_vld),
    //     .v_m_rdy            (v_bf_int_pre_allocate_rdy),
    //     .v_m_pld            (v_bf_int_pre_allocate_id ),
    //     .cancel_edge_en     (cancel_edge_en           )
    // );

    toy_physicial_regfile_top u_toy_physicial_regfile_top(
        .clk                        (clk                            ), 
        .rst_n                      (rst_n                          ), 
        .v_int_wr_en                (v_int_wr_en                    ), 
        .v_int_wr_reg_index         (v_wr_reg_index                 ), 
        .v_fp_wr_en                 (v_fp_wr_en                     ), 
        .v_fp_wr_reg_index          (v_wr_reg_index                 ), 
        .v_int_wr_en_forward        (v_int_wr_forward_en            ), 
        .v_int_wr_reg_forward_index (v_wr_reg_forward_index         ), 
        .v_fp_wr_en_forward         (v_fp_wr_forward_en             ), 
        .v_fp_wr_reg_forward_index  (v_wr_reg_forward_index         ), 
        .v_int_pre_allocate_rdy     (v_int_pre_allocate_rdy         ), 
        .v_int_pre_allocate_vld     (v_int_pre_allocate_vld         ), 
        .v_int_pre_allocate_id      (v_int_pre_allocate_id          ), 
        .v_fp_pre_allocate_rdy      (v_fp_pre_allocate_rdy          ), 
        .v_fp_pre_allocate_vld      (v_fp_pre_allocate_vld          ), 
        .v_fp_pre_allocate_id       (v_fp_pre_allocate_id           ), 
        .v_phy_reg_rs1_index        (v_phy_reg_rs1_index            ), 
        .v_phy_reg_rs2_index        (v_phy_reg_rs2_index            ), 
        .v_phy_reg_rs3_index        (v_phy_reg_rs3_index            ), 
        .v_int_rs1_rdy              (v_int_rs1_rdy                  ), 
        .v_int_rs2_rdy              (v_int_rs2_rdy                  ), 
        .v_fp_rs1_rdy               (v_fp_rs1_rdy                   ), 
        .v_fp_rs2_rdy               (v_fp_rs2_rdy                   ), 
        .v_fp_rs3_rdy               (v_fp_rs3_rdy                   ), 
        .v_int_rs1_forward          (v_int_rs1_forward              ), 
        .v_int_rs2_forward          (v_int_rs2_forward              ), 
        .v_fp_rs1_forward           (v_fp_rs1_forward               ), 
        .v_fp_rs2_forward           (v_fp_rs2_forward               ), 
        .v_fp_rs3_forward           (v_fp_rs3_forward               ), 
        .v_int_rs1_forward_id       (v_int_rs1_forward_id           ), 
        .v_int_rs2_forward_id       (v_int_rs2_forward_id           ), 
        .v_fp_rs1_forward_id        (v_fp_rs1_forward_id            ), 
        .v_fp_rs2_forward_id        (v_fp_rs2_forward_id            ), 
        .v_fp_rs3_forward_id        (v_fp_rs3_forward_id            ), 
        .v_int_phy_release          (v_int_phy_release              ), 
        .v_int_phy_back_ref         (v_int_phy_back_ref             ), 
        .v_int_phy_release_comb     (v_int_phy_release_comb         ), 
        .v_fp_phy_release           (v_fp_phy_release               ), 
        .v_fp_phy_back_ref          (v_fp_phy_back_ref              ), 
        .v_fp_phy_release_comb      (v_fp_phy_release_comb          ), 
        .cancel_en                  (cancel_en                      ),
        .cancel_edge_en             (cancel_edge_en                 )
    );
    //##############################################
    // raw cycle check
    //############################################## 


    generate
        for(genvar i=0;i<OOO_DEPTH;i=i+1)begin
            assign v_raw_int_cycle_not_lock[i] = (v_int_rs1_rdy[i] || ~v_inst_pld[i].use_rs1_en) && (v_int_rs2_rdy[i] || ~v_inst_pld[i].use_rs2_en);
            assign v_raw_fp_cycle_not_lock[i] = (v_fp_rs1_rdy[i] || ~v_inst_pld[i].use_rs1_fp_en) && (v_fp_rs2_rdy[i] || ~v_inst_pld[i].use_rs2_fp_en) && (v_fp_rs3_rdy[i] || ~v_inst_pld[i].use_rs3_fp_en);
        end
    endgenerate

    // //##############################################
    // // compare comb logic - int
    // // lock-1 && not lock -0
    // //############################################## 

    // assign v_int_rs1_raw[0] = 1'b0;
    // assign v_int_rs1_raw[1] = (v_inst_pld[1].phy_rs1==v_inst_pld[0].phy_rd && v_inst_pld[1].use_rs1_en && v_inst_pld[0].inst_rd_en) ;
    // assign v_int_rs1_raw[2] = (v_inst_pld[2].phy_rs1==v_inst_pld[1].phy_rd && v_inst_pld[2].use_rs1_en && v_inst_pld[1].inst_rd_en) ||
    //                           (v_inst_pld[2].phy_rs1==v_inst_pld[0].phy_rd && v_inst_pld[2].use_rs1_en && v_inst_pld[0].inst_rd_en) ;
    // assign v_int_rs1_raw[3] = (v_inst_pld[3].phy_rs1==v_inst_pld[2].phy_rd && v_inst_pld[3].use_rs1_en && v_inst_pld[2].inst_rd_en) || 
    //                           (v_inst_pld[3].phy_rs1==v_inst_pld[1].phy_rd && v_inst_pld[3].use_rs1_en && v_inst_pld[1].inst_rd_en) ||
    //                           (v_inst_pld[3].phy_rs1==v_inst_pld[0].phy_rd && v_inst_pld[3].use_rs1_en && v_inst_pld[0].inst_rd_en) ;

    // assign v_int_rs2_raw[0] = 1'b0;
    // assign v_int_rs2_raw[1] = (v_inst_pld[1].phy_rs2==v_inst_pld[0].phy_rd && v_inst_pld[1].use_rs2_en && v_inst_pld[0].inst_rd_en) ;
    // assign v_int_rs2_raw[2] = (v_inst_pld[2].phy_rs2==v_inst_pld[1].phy_rd && v_inst_pld[2].use_rs2_en && v_inst_pld[1].inst_rd_en) ||
    //                           (v_inst_pld[2].phy_rs2==v_inst_pld[0].phy_rd && v_inst_pld[2].use_rs2_en && v_inst_pld[0].inst_rd_en) ;
    // assign v_int_rs2_raw[3] = (v_inst_pld[3].phy_rs2==v_inst_pld[2].phy_rd && v_inst_pld[3].use_rs2_en && v_inst_pld[2].inst_rd_en) ||
    //                           (v_inst_pld[3].phy_rs2==v_inst_pld[1].phy_rd && v_inst_pld[3].use_rs2_en && v_inst_pld[1].inst_rd_en) ||
    //                           (v_inst_pld[3].phy_rs2==v_inst_pld[0].phy_rd && v_inst_pld[3].use_rs2_en && v_inst_pld[0].inst_rd_en) ;

    // assign v_int_not_lock[0] = 1'b1;
    // generate
    //     for(genvar i=1;i<OOO_DEPTH;i=i+1)begin
    //         assign v_int_not_lock[i] = ~(v_int_rs1_raw[i] || v_int_rs2_raw[i]);
    //     end
    // endgenerate

    // //##############################################
    // // compare comb logic - fp
    // //############################################## 
    // assign v_fp_rs1_raw[0] = 1'b0;
    // assign v_fp_rs1_raw[1] = (v_inst_pld[1].phy_rs1==v_inst_pld[0].phy_rd && v_inst_pld[1].use_rs1_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;
    // assign v_fp_rs1_raw[2] = (v_inst_pld[2].phy_rs1==v_inst_pld[1].phy_rd && v_inst_pld[2].use_rs1_fp_en && v_inst_pld[1].inst_fp_rd_en)  ||
    //                          (v_inst_pld[2].phy_rs1==v_inst_pld[0].phy_rd && v_inst_pld[2].use_rs1_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;
    // assign v_fp_rs1_raw[3] = (v_inst_pld[3].phy_rs1==v_inst_pld[2].phy_rd && v_inst_pld[3].use_rs1_fp_en && v_inst_pld[2].inst_fp_rd_en)  ||
    //                          (v_inst_pld[3].phy_rs1==v_inst_pld[1].phy_rd && v_inst_pld[3].use_rs1_fp_en && v_inst_pld[1].inst_fp_rd_en)  ||
    //                          (v_inst_pld[3].phy_rs1==v_inst_pld[0].phy_rd && v_inst_pld[3].use_rs1_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;

    // assign v_fp_rs2_raw[0] = 1'b0;
    // assign v_fp_rs2_raw[1] = (v_inst_pld[1].phy_rs2==v_inst_pld[0].phy_rd && v_inst_pld[1].use_rs2_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;
    // assign v_fp_rs2_raw[2] = (v_inst_pld[2].phy_rs2==v_inst_pld[1].phy_rd && v_inst_pld[2].use_rs2_fp_en && v_inst_pld[1].inst_fp_rd_en)  ||
    //                          (v_inst_pld[2].phy_rs2==v_inst_pld[0].phy_rd && v_inst_pld[2].use_rs2_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;
    // assign v_fp_rs2_raw[3] = (v_inst_pld[3].phy_rs2==v_inst_pld[2].phy_rd && v_inst_pld[3].use_rs2_fp_en && v_inst_pld[2].inst_fp_rd_en)  ||
    //                          (v_inst_pld[3].phy_rs2==v_inst_pld[1].phy_rd && v_inst_pld[3].use_rs2_fp_en && v_inst_pld[1].inst_fp_rd_en)  ||
    //                          (v_inst_pld[3].phy_rs2==v_inst_pld[0].phy_rd && v_inst_pld[3].use_rs2_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;

    // assign v_fp_rs3_raw[0] = 1'b0;
    // assign v_fp_rs3_raw[1] = (v_inst_pld[1].phy_rs3==v_inst_pld[0].phy_rd && v_inst_pld[1].use_rs3_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;
    // assign v_fp_rs3_raw[2] = (v_inst_pld[2].phy_rs3==v_inst_pld[1].phy_rd && v_inst_pld[2].use_rs3_fp_en && v_inst_pld[1].inst_fp_rd_en)  ||
    //                          (v_inst_pld[2].phy_rs3==v_inst_pld[0].phy_rd && v_inst_pld[2].use_rs3_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;
    // assign v_fp_rs3_raw[3] = (v_inst_pld[3].phy_rs3==v_inst_pld[2].phy_rd && v_inst_pld[3].use_rs3_fp_en && v_inst_pld[2].inst_fp_rd_en)  ||
    //                          (v_inst_pld[3].phy_rs3==v_inst_pld[1].phy_rd && v_inst_pld[3].use_rs3_fp_en && v_inst_pld[1].inst_fp_rd_en)  ||
    //                          (v_inst_pld[3].phy_rs3==v_inst_pld[0].phy_rd && v_inst_pld[3].use_rs3_fp_en && v_inst_pld[0].inst_fp_rd_en)  ;

    // assign v_fp_not_lock[0] = 1'b1;
    // generate
    //     for(genvar i=1;i<OOO_DEPTH;i=i+1)begin
    //         assign v_fp_not_lock[i] = ~(v_fp_rs1_raw[i] || v_fp_rs2_raw[i] || v_fp_rs3_raw[i]);
    //     end
    // endgenerate

    //##############################################
    // eu hazard 
    //############################################## 

    generate
        for (genvar i=0;i<OOO_DEPTH;i=i+1)begin
            if(i==0)begin
                assign v_unit_not_lock[i] = 1;
                assign v_goto_unit_previous[i] = 0;
                assign v_csr_mask[i] = v_inst_pld[i].goto_csr ? 'd1:{{(OOO_DEPTH){1'b1}}};
            end
            else begin
                // eu hazard =========================================================================
                assign v_goto_unit_previous[i] = v_goto_unit_previous[i-1] | v_goto_unit[i-1];
                assign v_unit_not_lock[i] = ~|(v_goto_unit[i] & v_goto_unit_previous[i]);
                assign v_csr_mask[i] = v_inst_pld[i].goto_csr ? (v_csr_mask[i-1] & {{(OOO_DEPTH-i){1'b0}},{i{1'b1}}}) : v_csr_mask[i-1];
            end
            // encode unit ===========================================================================
            assign v_goto_unit[i] = {v_inst_pld[i].goto_mext,v_inst_pld[i].goto_float|v_inst_pld[i].goto_csr};    

            // cycle check vld/rdy ===================================================================
            assign v_fp_csr_not_lock[i] = ~(v_inst_pld[i].goto_csr || v_inst_pld[i].goto_float)  || float_instruction_rdy;
            assign v_mext_not_lock[i]   = ~v_inst_pld[i].goto_mext || mext_instruction_rdy;
            // lsu hazard 
            assign v_lsu_not_lock[i] = ~v_inst_pld[i].goto_lsu ||  
                ((v_inst_pld[i].lsu_id[LSU_DEPTH_WIDTH]==lsu_buffer_rd_ptr[LSU_DEPTH_WIDTH]) && (v_inst_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]>=lsu_buffer_rd_ptr[LSU_DEPTH_WIDTH-1:0])) || 
                ((v_inst_pld[i].lsu_id[LSU_DEPTH_WIDTH]!=lsu_buffer_rd_ptr[LSU_DEPTH_WIDTH]) && (v_inst_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]<lsu_buffer_rd_ptr[LSU_DEPTH_WIDTH-1:0])) ;
        end
    endgenerate

    //##############################################
    // issue 
    //############################################## 
    assign v_inst_rdy = v_issue_en;
    // assign v_issue_en = v_int_not_lock & v_fp_not_lock & v_lsu_not_lock & v_unit_not_lock & v_raw_int_cycle_not_lock & v_raw_fp_cycle_not_lock;
    assign v_issue_en = v_inst_vld & v_lsu_not_lock & v_unit_not_lock & v_fp_csr_not_lock & v_mext_not_lock & v_raw_int_cycle_not_lock & v_raw_fp_cycle_not_lock & v_csr_mask[OOO_DEPTH-1];
    generate
        for (genvar i=0;i<OOO_DEPTH;i=i+1)begin
            assign v_issue_pld[i].inst_pld          = v_inst_pld[i].inst_pld             ;    
            assign v_issue_pld[i].inst_id           = v_inst_pld[i].inst_id              ;    
            assign v_issue_pld[i].phy_rd            = v_inst_pld[i].phy_rd               ;    
            assign v_issue_pld[i].arch_rd           = v_inst_pld[i].inst_rd              ;    
            assign v_issue_pld[i].inst_rd_en        = v_inst_pld[i].inst_rd_en           ;    
            assign v_issue_pld[i].inst_fp_rd_en     = v_inst_pld[i].inst_fp_rd_en        ;    
            assign v_issue_pld[i].c_ext             = v_inst_pld[i].c_ext                ;    
            assign v_issue_pld[i].inst_pc           = v_inst_pld[i].inst_pc              ;    
            assign v_issue_pld[i].reg_rs1_val       = v_reg_rs1_data[i]                  ;    
            assign v_issue_pld[i].reg_rs2_val       = v_reg_rs2_data[i]                  ;    
            assign v_issue_pld[i].reg_rs3_val       = v_reg_rs3_data[i]                  ;    
            assign v_issue_pld[i].inst_imm          = v_inst_pld[i].inst_imm             ;    
            assign v_issue_pld[i].fwd_pld.rs1_forward_cycle = v_inst_pld[i].use_rs1_en ? v_int_rs1_forward[i] : v_fp_rs1_forward[i]    ;    
            assign v_issue_pld[i].fwd_pld.rs2_forward_cycle = v_inst_pld[i].use_rs2_en ? v_int_rs2_forward[i] : v_fp_rs2_forward[i]    ;    
            assign v_issue_pld[i].fwd_pld.rs3_forward_cycle = v_fp_rs3_forward[i]        ;    
            assign v_issue_pld[i].fwd_pld.rs1_forward_id    = v_inst_pld[i].use_rs1_en ? v_int_rs1_forward_id[i] : v_fp_rs1_forward_id[i]       ;    
            assign v_issue_pld[i].fwd_pld.rs2_forward_id    = v_inst_pld[i].use_rs2_en ? v_int_rs2_forward_id[i] : v_fp_rs2_forward_id[i]       ;    
            assign v_issue_pld[i].fwd_pld.rs3_forward_id    = v_fp_rs3_forward_id[i]       ;    
            // assign v_issue_pld[i].use_rs1_fp_en     = v_inst_pld[i].use_rs1_fp_en        ;    
            // assign v_issue_pld[i].use_rs2_fp_en     = v_inst_pld[i].use_rs2_fp_en        ;    
            // assign v_issue_pld[i].use_rs3_fp_en     = v_inst_pld[i].use_rs3_fp_en        ;    
            // assign v_issue_pld[i].use_rs1_en        = v_inst_pld[i].use_rs1_en           ;    
            // assign v_issue_pld[i].use_rs2_en        = v_inst_pld[i].use_rs2_en           ;    
            assign v_issue_pld[i].goto_lsu           = v_inst_pld[i].goto_lsu                ;    
            assign v_issue_pld[i].goto_ldu           = v_inst_pld[i].goto_ldu                ;    
            assign v_issue_pld[i].goto_stu           = v_inst_pld[i].goto_stu                ;    
            assign v_issue_pld[i].goto_alu           = v_inst_pld[i].goto_alu                ;    
            assign v_issue_pld[i].goto_err           = v_inst_pld[i].goto_err                ;    
            assign v_issue_pld[i].goto_mext          = v_inst_pld[i].goto_mext               ;    
            assign v_issue_pld[i].goto_csr           = v_inst_pld[i].goto_csr                ;    
            assign v_issue_pld[i].goto_float         = v_inst_pld[i].goto_float              ;    
            assign v_issue_pld[i].goto_custom        = v_inst_pld[i].goto_custom             ;    
            assign v_issue_pld[i].lsu_id             = v_inst_pld[i].lsu_id                  ; 
            assign v_issue_pld[i].eu_bp_pld.pred_pc  = v_inst_pld[i].fe_bypass_pld.pred_pc   ;  
            assign v_issue_pld[i].eu_bp_pld.tgt_pc   = v_inst_pld[i].fe_bypass_pld.tgt_pc    ; 
            assign v_issue_pld[i].eu_bp_pld.is_last  = v_inst_pld[i].fe_bypass_pld.is_last   ;
            assign v_issue_pld[i].eu_bp_pld.is_cext  = v_inst_pld[i].fe_bypass_pld.is_cext   ;
            assign v_issue_pld[i].eu_bp_pld.carry    = v_inst_pld[i].fe_bypass_pld.carry     ;
            assign v_issue_pld[i].eu_bp_pld.offset   = v_inst_pld[i].fe_bypass_pld.offset    ; 
            assign v_issue_pld[i].eu_bp_pld.taken    = v_inst_pld[i].fe_bypass_pld.taken     ;            
        end
    endgenerate



    `ifdef TOY_SIM


        logic [INST_DECODE_NUM-1:0] v_monitor_eu_hazard;
        logic [INST_DECODE_NUM-1:0] v_monitor_reg_lock;
        assign v_monitor_eu_hazard = ~v_lsu_not_lock | ~v_unit_not_lock | ~v_fp_csr_not_lock | ~v_mext_not_lock;
        assign v_monitor_reg_lock = ~v_raw_int_cycle_not_lock | ~v_raw_fp_cycle_not_lock;
 
        logic [31:0] issue_entry_cnt [3:0];
        generate
            for(genvar a=0;a<4;a=a+1)begin
                always_ff @(posedge clk or negedge rst_n) begin
                    if(~rst_n)begin
                        issue_entry_cnt[a] <= 32'b0;
                    end
                    else if(v_issue_en[a])begin
                        issue_entry_cnt[a] <= issue_entry_cnt[a] + 1'b1;
                    end
                end
            end
        endgenerate
        logic [31:0] issue_0_cnt;
        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                issue_0_cnt <= 32'b0;
            end
            else if(~|(v_issue_en))begin
                issue_0_cnt <= issue_0_cnt + 1'b1;
            end
            
        end

    `endif



endmodule

