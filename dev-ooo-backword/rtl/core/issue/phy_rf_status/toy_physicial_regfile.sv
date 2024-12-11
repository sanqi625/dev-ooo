module toy_physicial_regfile 
    import toy_pack::*; 
#(
    parameter   int unsigned MODE          = 0  //0-INT 1-FP
)
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,
    // wr back status
    input  logic   [EU_NUM-1            :0]     v_wr_en                 ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_wr_reg_index          [EU_NUM-1           :0],
    // wr back forward status
    input  logic   [EU_NUM-1            :0]     v_wr_en_forward         ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_wr_reg_forward_index  [EU_NUM-1           :0],
    // pre alloc 
    input  logic   [INST_DECODE_NUM-1   :0]     v_pre_allocate_rdy      ,
    output logic   [INST_DECODE_NUM-1   :0]     v_pre_allocate_vld      ,
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_pre_allocate_id       [INST_DECODE_NUM-1  :0],
    // look up phy reg index  
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs1_index     [INST_DECODE_NUM-1  :0],
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs2_index     [INST_DECODE_NUM-1  :0],
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_phy_reg_rs3_index     [INST_DECODE_NUM-1  :0],
    // phy reg status
    output logic   [INST_DECODE_NUM-1   :0]     v_reg_rs1_rdy           , 
    output logic   [INST_DECODE_NUM-1   :0]     v_reg_rs2_rdy           , 
    output logic   [INST_DECODE_NUM-1   :0]     v_reg_rs3_rdy           , 
    // phy reg forward status
    output logic   [FORWARD_NUM-1       :0]     v_reg_rs1_forward       [INST_DECODE_NUM-1  :0], 
    output logic   [FORWARD_NUM-1       :0]     v_reg_rs2_forward       [INST_DECODE_NUM-1  :0], 
    output logic   [FORWARD_NUM-1       :0]     v_reg_rs3_forward       [INST_DECODE_NUM-1  :0], 
    
    output logic   [EU_NUM_WIDTH-1      :0]     v_reg_rs1_forward_id    [INST_DECODE_NUM-1  :0], 
    output logic   [EU_NUM_WIDTH-1      :0]     v_reg_rs2_forward_id    [INST_DECODE_NUM-1  :0], 
    output logic   [EU_NUM_WIDTH-1      :0]     v_reg_rs3_forward_id    [INST_DECODE_NUM-1  :0], 
    // backup rename status
    input  logic   [PHY_REG_NUM-1       :0]     v_reg_phy_release       ,
    input  logic   [PHY_REG_NUM-1       :0]     v_reg_phy_back_ref      ,
    input  logic   [PHY_REG_NUM-1       :0]     v_reg_phy_release_comb  , 
    // cancel 
    input  logic                                cancel_en               ,          
    input  logic                                cancel_edge_en          

);
    //##############################################
    // logic  
    //############################################## 
    logic [PHY_REG_NUM-1        :0] v_entry_idle            ;
    logic [INST_DECODE_NUM-1    :0] v_allocate_vld          ;
    logic [INST_DECODE_NUM-1    :0] v_allocate_rdy          ;
    logic [PHY_REG_NUM-1        :0] v_allocate_entry_en     ;
    logic [PHY_REG_NUM-1        :0] v_reg_phy_rdy           ;
    logic [PHY_REG_NUM-1        :0] v_bitmap_wr_en          ;
    logic [PHY_REG_NUM-1        :0] v_bitmap_forward_wr_en  ;
    logic [PHY_REG_NUM-1        :0] v_allocate_oh           [INST_DECODE_NUM-1  :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_allocate_id           [INST_DECODE_NUM-1  :0];
    logic [REG_WIDTH-1          :0] v_reg_phy_data          [PHY_REG_NUM-1      :0];
    logic [FORWARD_NUM-1        :0] v_reg_phy_rdy_oh        [PHY_REG_NUM-1      :0];    
    logic [PHY_REG_NUM-1        :0] vv_bitmap_wr_en         [EU_NUM-1           :0];
    logic [PHY_REG_NUM-1        :0] vv_bitmap_forward_wr_en [EU_NUM-1           :0];
    logic [EU_NUM_WIDTH-1       :0] v_bitmap_wr_forward_id  [PHY_REG_NUM-1      :0];
    logic [EU_NUM_WIDTH-1       :0] v_reg_phy_forward_id    [PHY_REG_NUM-1      :0];
    logic [PHY_REG_NUM-1        :0] vv_allocate_entry_en    [INST_DECODE_NUM-1    :0];
    //##############################################
    // pre allocate 
    //############################################## 
    generate
        for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin : PHY_REGFILE_
            assign v_reg_rs1_rdy[i]     = v_reg_phy_rdy[v_phy_reg_rs1_index[i]];
            assign v_reg_rs2_rdy[i]     = v_reg_phy_rdy[v_phy_reg_rs2_index[i]];
            assign v_reg_rs3_rdy[i]     = v_reg_phy_rdy[v_phy_reg_rs3_index[i]];

            assign v_reg_rs1_forward[i] = v_reg_phy_rdy_oh[v_phy_reg_rs1_index[i]];
            assign v_reg_rs2_forward[i] = v_reg_phy_rdy_oh[v_phy_reg_rs2_index[i]];
            assign v_reg_rs3_forward[i] = v_reg_phy_rdy_oh[v_phy_reg_rs3_index[i]];

            assign v_reg_rs1_forward_id[i] = v_reg_phy_forward_id[v_phy_reg_rs1_index[i]];
            assign v_reg_rs2_forward_id[i] = v_reg_phy_forward_id[v_phy_reg_rs2_index[i]];
            assign v_reg_rs3_forward_id[i] = v_reg_phy_forward_id[v_phy_reg_rs3_index[i]];

        end
    endgenerate

    cmn_list_lead_one #(
        .ENTRY_NUM      (PHY_REG_NUM            ),
        .REQ_NUM        (INST_DECODE_NUM        )
    )u_phy_reg_alloc(
        .v_entry_vld    (v_entry_idle           ),
        .v_free_idx_oh  (v_allocate_oh          ),
        .v_free_idx_bin (v_allocate_id          ),
        .v_free_vld     (v_allocate_vld         )
    );

    toy_pre_alloc_buffer u_toy_pre_alloc_buffer(
        .clk                (clk                     ),
        .rst_n              (rst_n                   ),
        .v_s_vld            (v_allocate_vld          ),
        .v_s_rdy            (v_allocate_rdy          ),
        .v_s_pld            (v_allocate_id           ),
        .v_m_vld            (v_pre_allocate_vld      ),
        .v_m_rdy            (v_pre_allocate_rdy      ),
        .v_m_pld            (v_pre_allocate_id       ),
        .cancel_edge_en     (cancel_en               )
    );
    //##############################################
    // entry
    //############################################## 
    assign v_allocate_entry_en = vv_allocate_entry_en[0] | vv_allocate_entry_en[1] | vv_allocate_entry_en[2] | vv_allocate_entry_en[3];

    assign v_bitmap_wr_en = vv_bitmap_wr_en[0] | vv_bitmap_wr_en[1] | vv_bitmap_wr_en[2] | vv_bitmap_wr_en[3] | 
                            vv_bitmap_wr_en[4] | vv_bitmap_wr_en[5] | vv_bitmap_wr_en[6] | vv_bitmap_wr_en[7] | 
                            vv_bitmap_wr_en[8] | vv_bitmap_wr_en[9];
    assign v_bitmap_forward_wr_en  = vv_bitmap_forward_wr_en[0]  | vv_bitmap_forward_wr_en[1]  | vv_bitmap_forward_wr_en[2]  | vv_bitmap_forward_wr_en[3]  | 
                                     vv_bitmap_forward_wr_en[4]  | vv_bitmap_forward_wr_en[5]  | vv_bitmap_forward_wr_en[6]  | vv_bitmap_forward_wr_en[7]  | 
                                     vv_bitmap_forward_wr_en[8]  | vv_bitmap_forward_wr_en[9];


    generate
        for(genvar j=0;j<PHY_REG_NUM;j=j+1)begin
            for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
                assign vv_allocate_entry_en[i][j] = v_allocate_oh[i][j] && v_allocate_rdy[i];
            end
            for(genvar i=0;i<EU_NUM;i=i+1)begin
                assign vv_bitmap_wr_en[i][j] = (j==v_wr_reg_index[i]) && v_wr_en[i];
                assign vv_bitmap_forward_wr_en[i][j] = (j==v_wr_reg_forward_index[i]) && v_wr_en_forward[i];
            end

            assign v_bitmap_wr_forward_id[j] =vv_bitmap_forward_wr_en[9][j] ? 9:
                                              vv_bitmap_forward_wr_en[8][j] ? 8:
                                              vv_bitmap_forward_wr_en[7][j] ? 7:
                                              vv_bitmap_forward_wr_en[6][j] ? 6:
                                              vv_bitmap_forward_wr_en[5][j] ? 5:
                                              vv_bitmap_forward_wr_en[4][j] ? 4:     
                                              vv_bitmap_forward_wr_en[3][j] ? 3:
                                              vv_bitmap_forward_wr_en[2][j] ? 2:
                                              vv_bitmap_forward_wr_en[1][j] ? 1:0;


            toy_physicial_regfile_entry #(
                .PHY_REG_ID         (j                          ),
                .MODE               (MODE                       )
            )
            u_toy_physicial_regfile_entry(
                .clk                (clk                        ),
                .rst_n              (rst_n                      ),
                .reg_phy_rdy        (v_reg_phy_rdy[j]           ),
                .reg_phy_rdy_oh     (v_reg_phy_rdy_oh[j]        ),
                .reg_phy_forward_id (v_reg_phy_forward_id[j]    ),
                .phy_release_comb_en(v_reg_phy_release_comb[j]  ),
                .phy_release_en     (v_reg_phy_release[j]       ),
                .phy_ref_en         (v_reg_phy_back_ref[j]      ),
                .cancel_edge_en     (cancel_edge_en             ),
                .allocate_en        (v_allocate_entry_en[j]     ),
                .entry_idle         (v_entry_idle[j]            ),
                .wr_en_forward      (v_bitmap_forward_wr_en[j]  ),
                .wr_forward_id      (v_bitmap_wr_forward_id[j]  ),
                .wr_en              (v_bitmap_wr_en[j]          )
            );
        end
    endgenerate
    //##############################################
    // TOY_SIM
    //############################################## 
    `ifdef TOY_SIM

    logic [31:0] sum_cnt [PHY_REG_NUM-1:0];
    generate
        for(genvar j=0;j<PHY_REG_NUM;j=j+1)begin
            if(j==0)begin
                assign sum_cnt[j] = 32'(v_entry_idle[j]==0);
            end
            else begin
                always_comb begin 
                    if(v_entry_idle[j]==0)begin
                        sum_cnt[j] = sum_cnt[j-1] + 1 ;
                    end
                    else begin
                        sum_cnt[j] = sum_cnt[j-1]  ;
                        
                    end
                end
            end

        end
    endgenerate
    logic [31:0] monitor_0;
    logic [31:0] monitor_1;
    assign monitor_0 = sum_cnt[PHY_REG_NUM-1];
    assign monitor_1 = PHY_REG_NUM - sum_cnt[PHY_REG_NUM-1];
    `endif
    
endmodule