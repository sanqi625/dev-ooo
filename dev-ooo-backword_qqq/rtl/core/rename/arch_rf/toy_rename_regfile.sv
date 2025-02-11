module toy_rename_regfile
    import toy_pack::*;
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    input  logic   [INST_DECODE_NUM-1   :0]     v_int_pre_en            , 
    input  logic   [INST_DECODE_NUM-1   :0]     v_fp_pre_en             , 
    
    input  logic   [INST_DECODE_NUM-1   :0]     v_int_rd_en             , //check pre alloc,in order hazard
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_rd_allocate_id    [INST_DECODE_NUM-1:0],
    input  logic   [INST_DECODE_NUM-1   :0]     v_fp_rd_en              , //check pre alloc,in order hazard
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_rd_allocate_id     [INST_DECODE_NUM-1:0],
    input  logic   [4                   :0]     v_rd_index              [INST_DECODE_NUM-1:0],

    input  logic                                cancel_edge_en_d        ,
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_backup_phy_id     [ARCH_ENTRY_NUM-1 :0],
    input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_backup_phy_id      [ARCH_ENTRY_NUM-1 :0],

    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_phy_id            [ARCH_ENTRY_NUM-1 :0], 
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_phy_id             [ARCH_ENTRY_NUM-1 :0] 

);
    //##############################################
    // logic
    //############################################## 
    // logic                           cancel_edge_en_d    ;
    logic [ARCH_ENTRY_NUM-1     :0] v_int_bitmap_rd_en  ;
    logic [ARCH_ENTRY_NUM-1     :0] v_fp_bitmap_rd_en   ;
    logic [ARCH_ENTRY_NUM-1     :0] vv_int_mask         [INST_DECODE_NUM-1:0];
    logic [ARCH_ENTRY_NUM-1     :0] vv_fp_mask          [INST_DECODE_NUM-1:0];
    logic [ARCH_ENTRY_NUM-1     :0] vv_int_bitmap_rd_en [INST_DECODE_NUM-1:0];
    logic [ARCH_ENTRY_NUM-1     :0] vv_fp_bitmap_rd_en  [INST_DECODE_NUM-1:0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_int_bitmap_rd_data[ARCH_ENTRY_NUM-1 :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_fp_bitmap_rd_data [ARCH_ENTRY_NUM-1 :0];
    logic [ARCH_ENTRY_NUM-1     :0] vv_int_bitmap_rd_en_mask    [INST_DECODE_NUM-1:0];
    logic [ARCH_ENTRY_NUM-1     :0] vv_fp_bitmap_rd_en_mask     [INST_DECODE_NUM-1:0];
    //##############################################
    // cancel delay 
    //############################################## 

    // always_ff @(posedge clk or negedge rst_n) begin
    //     if(~rst_n)begin
    //         cancel_edge_en_d <= 1'b0;
    //     end
    //     else begin
    //         cancel_edge_en_d <= cancel_edge_en;
    //     end
    // end

    //##############################################
    // 4-32 crossbar
    //############################################## 
    assign v_int_bitmap_rd_en = vv_int_bitmap_rd_en_mask[0] | vv_int_bitmap_rd_en_mask[1] | vv_int_bitmap_rd_en_mask[2] | vv_int_bitmap_rd_en_mask[3];
    assign v_fp_bitmap_rd_en  = vv_fp_bitmap_rd_en_mask[0]  | vv_fp_bitmap_rd_en_mask[1]  | vv_fp_bitmap_rd_en_mask[2]  | vv_fp_bitmap_rd_en_mask[3] ;
    // assign v_int_bitmap_rd_en = vv_int_bitmap_rd_en[0] | vv_int_bitmap_rd_en[1] | vv_int_bitmap_rd_en[2] | vv_int_bitmap_rd_en[3];
    // assign v_fp_bitmap_rd_en  = vv_fp_bitmap_rd_en[0]  | vv_fp_bitmap_rd_en[1]  | vv_fp_bitmap_rd_en[2]  | vv_fp_bitmap_rd_en[3] ;

    generate

        for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
            assign vv_int_bitmap_rd_en_mask[i] = vv_int_bitmap_rd_en[i] & vv_int_mask[i];
            assign vv_fp_bitmap_rd_en_mask[i] = vv_fp_bitmap_rd_en[i] & vv_fp_mask[i];
        end
        for(genvar j=0;j<ARCH_ENTRY_NUM;j=j+1)begin:RENAME_FILE_
            for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
                // assign vv_int_bitmap_rd_en[i][j] = (j==v_rd_index[i]) && v_int_rd_en[i];
                // assign vv_fp_bitmap_rd_en[i][j] = (j==v_rd_index[i]) && v_fp_rd_en[i];
                assign vv_int_bitmap_rd_en[i][j] = (j==v_rd_index[i]) && v_int_pre_en[i];
                assign vv_fp_bitmap_rd_en[i][j] = (j==v_rd_index[i]) && v_fp_pre_en[i];
                assign vv_int_mask[i][j] = v_int_rd_en[i];
                assign vv_fp_mask[i][j] = v_fp_rd_en[i];
            end

            assign v_int_bitmap_rd_data[j] =  vv_int_bitmap_rd_en_mask[3][j] ? v_int_rd_allocate_id[3]:
                                              vv_int_bitmap_rd_en_mask[2][j] ? v_int_rd_allocate_id[2]:
                                              vv_int_bitmap_rd_en_mask[1][j] ? v_int_rd_allocate_id[1]:
                                              v_int_rd_allocate_id[0];

            assign v_fp_bitmap_rd_data[j] =   vv_fp_bitmap_rd_en_mask[3][j] ? v_fp_rd_allocate_id[3]:
                                              vv_fp_bitmap_rd_en_mask[2][j] ? v_fp_rd_allocate_id[2]:
                                              vv_fp_bitmap_rd_en_mask[1][j] ? v_fp_rd_allocate_id[1]:
                                              v_fp_rd_allocate_id[0];


            // assign v_int_bitmap_rd_data[j] =  vv_int_bitmap_rd_en[3][j] ? v_int_rd_allocate_id[3]:
            //                                   vv_int_bitmap_rd_en[2][j] ? v_int_rd_allocate_id[2]:
            //                                   vv_int_bitmap_rd_en[1][j] ? v_int_rd_allocate_id[1]:
            //                                   v_int_rd_allocate_id[0];

            // assign v_fp_bitmap_rd_data[j] =   vv_fp_bitmap_rd_en[3][j] ? v_fp_rd_allocate_id[3]:
            //                                   vv_fp_bitmap_rd_en[2][j] ? v_fp_rd_allocate_id[2]:
            //                                   vv_fp_bitmap_rd_en[1][j] ? v_fp_rd_allocate_id[1]:
            //                                   v_fp_rd_allocate_id[0];
            // int_entry ------------------------------------------------------------------------------------
            toy_rename_regfile_entry #(
                .ARCH_REG_ID(j),
                .MODE       (0)
            )u_int_rename_regfile_entry(
                .clk                    (clk                            ),
                .rst_n                  (rst_n                          ),
                .reg_rd_allocate_id     (v_int_bitmap_rd_data[j]        ),
                .reg_rd_en              (v_int_bitmap_rd_en[j]          ),
                .cancel_edge_en         (cancel_edge_en_d               ),
                .reg_backup_phy_id      (v_int_backup_phy_id[j]         ),
                .reg_phy_id             (v_int_phy_id[j]                )
            );
            // fp_entry  ------------------------------------------------------------------------------------
            toy_rename_regfile_entry #(
                .ARCH_REG_ID(j),
                .MODE       (1)
            )u_fp_rename_regfile_entry(
                .clk                    (clk                            ),
                .rst_n                  (rst_n                          ),
                .reg_rd_allocate_id     (v_fp_bitmap_rd_data[j]         ),
                .reg_rd_en              (v_fp_bitmap_rd_en[j]           ),
                .cancel_edge_en         (cancel_edge_en_d               ),
                .reg_backup_phy_id      (v_fp_backup_phy_id[j]          ),
                .reg_phy_id             (v_fp_phy_id[j]                 )
            );
        end       
    endgenerate


endmodule