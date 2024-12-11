module toy_backup_rename_regfile_top
    import toy_pack::*;
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    input  logic   [COMMIT_REL_CHANNEL-1:0]     v_commit_en             ,
    input  commit_pkg                           v_commit_pld            [COMMIT_REL_CHANNEL-1:0],
    
    output logic   [PHY_REG_NUM-1       :0]     v_int_phy_release       ,
    output logic   [PHY_REG_NUM-1       :0]     v_int_phy_back_ref      ,
    output logic   [PHY_REG_NUM-1       :0]     v_int_phy_release_comb  , 
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_backup_phy_id     [ARCH_ENTRY_NUM-1   :0],

    output logic   [PHY_REG_NUM-1       :0]     v_fp_phy_release        ,
    output logic   [PHY_REG_NUM-1       :0]     v_fp_phy_back_ref       ,
    output logic   [PHY_REG_NUM-1       :0]     v_fp_phy_release_comb   ,
    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_backup_phy_id      [ARCH_ENTRY_NUM-1   :0]

);

    //##############################################
    // inst
    //############################################## 

    toy_backup_rename_regfile #(
        .MODE       (0)
    )u_int_backup_rename_regfile(
        .clk                    (clk                            ),
        .rst_n                  (rst_n                          ),
        .v_commit_en            (v_commit_en                    ),
        .v_commit_pld           (v_commit_pld                   ),
        .v_reg_backup_phy_id    (v_int_backup_phy_id            ),
        .v_phy_release          (v_int_phy_release              ),
        .v_phy_back_ref         (v_int_phy_back_ref             ),
        .v_phy_release_comb     (v_int_phy_release_comb         )
    );


    toy_backup_rename_regfile #(
        .MODE       (1)
    )u_fp_backup_rename_regfile(
        .clk                    (clk                            ),
        .rst_n                  (rst_n                          ),
        .v_commit_en            (v_commit_en                    ),
        .v_commit_pld           (v_commit_pld                   ),
        .v_reg_backup_phy_id    (v_fp_backup_phy_id             ),
        .v_phy_release          (v_fp_phy_release               ),
        .v_phy_back_ref         (v_fp_phy_back_ref              ),
        .v_phy_release_comb     (v_fp_phy_release_comb          )
    );







endmodule