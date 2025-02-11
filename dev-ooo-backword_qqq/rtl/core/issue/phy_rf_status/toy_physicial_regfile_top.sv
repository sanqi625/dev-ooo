module toy_physicial_regfile_top
    import toy_pack::*; 
(
    input  logic                                clk                         ,
    input  logic                                rst_n                       ,
    // wr back status
    input  logic   [EU_NUM-1            :0]     v_int_wr_en                 ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_wr_reg_index          [EU_NUM-1           :0],
    input  logic   [EU_NUM-1            :0]     v_fp_wr_en                  ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_wr_reg_index           [EU_NUM-1           :0],
    // wr back forward status
    input  logic   [EU_NUM-1            :0]     v_int_wr_en_forward         ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_wr_reg_forward_index  [EU_NUM-1           :0],
    input  logic   [EU_NUM-1            :0]     v_fp_wr_en_forward          ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_wr_reg_forward_index   [EU_NUM-1           :0],
    // pre alloc 
    input  logic   [INST_DECODE_NUM-1   :0]     v_int_pre_allocate_rdy      ,
    output logic   [INST_DECODE_NUM-1   :0]     v_int_pre_allocate_vld      ,
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_pre_allocate_id       [INST_DECODE_NUM-1  :0],

    input  logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_allocate_rdy       ,
    output logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_allocate_vld       ,
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_pre_allocate_id        [INST_DECODE_NUM-1  :0],
    // look up phy reg index  
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs1_index         [INST_DECODE_NUM-1  :0],
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs2_index         [INST_DECODE_NUM-1  :0],
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs3_index         [INST_DECODE_NUM-1  :0],
    // phy reg status
    output logic   [INST_DECODE_NUM-1   :0]     v_int_rs1_rdy               , 
    output logic   [INST_DECODE_NUM-1   :0]     v_int_rs2_rdy               , 

    output logic   [INST_DECODE_NUM-1   :0]     v_fp_rs1_rdy                , 
    output logic   [INST_DECODE_NUM-1   :0]     v_fp_rs2_rdy                , 
    output logic   [INST_DECODE_NUM-1   :0]     v_fp_rs3_rdy                , 
    // phy reg forward status
    output logic   [FORWARD_NUM-1       :0]     v_int_rs1_forward           [INST_DECODE_NUM-1  :0], 
    output logic   [FORWARD_NUM-1       :0]     v_int_rs2_forward           [INST_DECODE_NUM-1  :0], 

    output logic   [FORWARD_NUM-1       :0]     v_fp_rs1_forward            [INST_DECODE_NUM-1  :0], 
    output logic   [FORWARD_NUM-1       :0]     v_fp_rs2_forward            [INST_DECODE_NUM-1  :0], 
    output logic   [FORWARD_NUM-1       :0]     v_fp_rs3_forward            [INST_DECODE_NUM-1  :0], 
    // phy reg forward id
    output logic   [EU_NUM_WIDTH-1      :0]     v_int_rs1_forward_id        [INST_DECODE_NUM-1  :0], 
    output logic   [EU_NUM_WIDTH-1      :0]     v_int_rs2_forward_id        [INST_DECODE_NUM-1  :0], 
    
    output logic   [EU_NUM_WIDTH-1      :0]     v_fp_rs1_forward_id         [INST_DECODE_NUM-1  :0], 
    output logic   [EU_NUM_WIDTH-1      :0]     v_fp_rs2_forward_id         [INST_DECODE_NUM-1  :0], 
    output logic   [EU_NUM_WIDTH-1      :0]     v_fp_rs3_forward_id         [INST_DECODE_NUM-1  :0], 
    // backup rename status
    input  logic   [PHY_REG_NUM-1       :0]     v_int_phy_release           ,
    input  logic   [PHY_REG_NUM-1       :0]     v_int_phy_back_ref          ,
    input  logic   [PHY_REG_NUM-1       :0]     v_int_phy_release_comb      ,

    input  logic   [PHY_REG_NUM-1       :0]     v_fp_phy_release            ,
    input  logic   [PHY_REG_NUM-1       :0]     v_fp_phy_back_ref           ,
    input  logic   [PHY_REG_NUM-1       :0]     v_fp_phy_release_comb       ,  
    // cancel 
    input  logic                                cancel_en               ,          
    input  logic                                cancel_edge_en          

);
    //##############################################
    // inst  
    //############################################## 

    toy_physicial_regfile #(
        .MODE                   (0                          )
    )
    u_int_physicial_regfile(
        .clk                    (clk                        ),
        .rst_n                  (rst_n                      ),
        .v_wr_en                (v_int_wr_en                ),  
        .v_wr_reg_index         (v_int_wr_reg_index         ),  
        .v_wr_en_forward        (v_int_wr_en_forward        ),  
        .v_wr_reg_forward_index (v_int_wr_reg_forward_index ),  
        .v_pre_allocate_rdy     (v_int_pre_allocate_rdy     ),  
        .v_pre_allocate_vld     (v_int_pre_allocate_vld     ),  
        .v_pre_allocate_id      (v_int_pre_allocate_id      ),  
        .v_phy_reg_rs1_index    (v_phy_reg_rs1_index        ),  
        .v_phy_reg_rs2_index    (v_phy_reg_rs2_index        ),  
        .v_phy_reg_rs3_index    (v_phy_reg_rs3_index        ),  
        .v_reg_rs1_rdy          (v_int_rs1_rdy              ),  
        .v_reg_rs2_rdy          (v_int_rs2_rdy              ),  
        .v_reg_rs3_rdy          (                           ),  
        .v_reg_rs1_forward      (v_int_rs1_forward          ),  
        .v_reg_rs2_forward      (v_int_rs2_forward          ),  
        .v_reg_rs3_forward      (                           ),  
        .v_reg_rs1_forward_id   (v_int_rs1_forward_id       ),
        .v_reg_rs2_forward_id   (v_int_rs2_forward_id       ),
        .v_reg_rs3_forward_id   (                           ),
        .v_reg_phy_release      (v_int_phy_release          ),  
        .v_reg_phy_back_ref     (v_int_phy_back_ref         ),  
        .v_reg_phy_release_comb (v_int_phy_release_comb     ),  
        .cancel_en              (cancel_en                  ),
        .cancel_edge_en         (cancel_edge_en             )
    );

    toy_physicial_regfile #(
        .MODE                   (1                          )
    )
    u_fp_physicial_regfile(
        .clk                    (clk                        ),
        .rst_n                  (rst_n                      ),
        .v_wr_en                (v_fp_wr_en                 ),  
        .v_wr_reg_index         (v_fp_wr_reg_index          ),  
        .v_wr_en_forward        (v_fp_wr_en_forward         ),  
        .v_wr_reg_forward_index (v_fp_wr_reg_forward_index  ),  
        .v_pre_allocate_rdy     (v_fp_pre_allocate_rdy      ),  
        .v_pre_allocate_vld     (v_fp_pre_allocate_vld      ),  
        .v_pre_allocate_id      (v_fp_pre_allocate_id       ),  
        .v_phy_reg_rs1_index    (v_phy_reg_rs1_index        ),  
        .v_phy_reg_rs2_index    (v_phy_reg_rs2_index        ),  
        .v_phy_reg_rs3_index    (v_phy_reg_rs3_index        ),  
        .v_reg_rs1_rdy          (v_fp_rs1_rdy               ),  
        .v_reg_rs2_rdy          (v_fp_rs2_rdy               ),  
        .v_reg_rs3_rdy          (v_fp_rs3_rdy               ),  
        .v_reg_rs1_forward      (v_fp_rs1_forward           ),  
        .v_reg_rs2_forward      (v_fp_rs2_forward           ),  
        .v_reg_rs3_forward      (v_fp_rs3_forward           ),  
        .v_reg_rs1_forward_id   (v_fp_rs1_forward_id        ),
        .v_reg_rs2_forward_id   (v_fp_rs2_forward_id        ),
        .v_reg_rs3_forward_id   (v_fp_rs3_forward_id        ),
        .v_reg_phy_release      (v_fp_phy_release           ),  
        .v_reg_phy_back_ref     (v_fp_phy_back_ref          ),  
        .v_reg_phy_release_comb (v_fp_phy_release_comb      ),  
        .cancel_en              (cancel_en                  ),
        .cancel_edge_en         (cancel_edge_en             )  
    );
endmodule