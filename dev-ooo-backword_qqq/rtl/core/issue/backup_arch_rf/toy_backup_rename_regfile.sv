module toy_backup_rename_regfile
    import toy_pack::*;
#(
    parameter   int unsigned MODE          = 0  //0-INT 1-FP
)
(
    input  logic                                clk                     ,
    input  logic                                rst_n                   ,

    output logic   [PHY_REG_ID_WIDTH-1  :0]     v_reg_backup_phy_id     [ARCH_ENTRY_NUM-1 :0],

    input  logic   [COMMIT_REL_CHANNEL-1:0]     v_commit_en             ,
    input  commit_pkg                           v_commit_pld            [COMMIT_REL_CHANNEL-1:0],
    
    output logic   [PHY_REG_NUM-1       :0]     v_phy_release           ,
    output logic   [PHY_REG_NUM-1       :0]     v_phy_back_ref          ,
    output logic   [PHY_REG_NUM-1       :0]     v_phy_release_comb   

);
    //##############################################
    // logic
    //############################################## 
    logic [ARCH_ENTRY_NUM-1     :0] v_rd_en                 ;
    logic [COMMIT_REL_CHANNEL-2 :0] v_phy_release_comb_en   ;
    logic [COMMIT_REL_CHANNEL-1 :0] v_phy_release_en        ;
    logic [ARCH_ENTRY_NUM-1     :0] vv_rd_en                [COMMIT_REL_CHANNEL-1   :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_reg_phy_id            [ARCH_ENTRY_NUM-1       :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_commit_phy_index      [ARCH_ENTRY_NUM-1       :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_phy_release_comb_index[COMMIT_REL_CHANNEL-2   :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_phy_release_index     [COMMIT_REL_CHANNEL-1   :0];
    logic [PHY_REG_ID_WIDTH-1   :0] v_phy_backup_index      [COMMIT_REL_CHANNEL-1   :0];
    logic [PHY_REG_NUM-1        :0] vv_phy_release          [COMMIT_REL_CHANNEL-1   :0];
    logic [PHY_REG_NUM-1        :0] vv_phy_back_ref         [COMMIT_REL_CHANNEL-1   :0];
    logic [PHY_REG_NUM-1        :0] vv_phy_release_comb     [COMMIT_REL_CHANNEL-2   :0];
    //##############################################
    // entry
    //############################################## 
    assign v_reg_backup_phy_id  = v_reg_phy_id;
    assign v_rd_en = vv_rd_en[0] | vv_rd_en[1] | vv_rd_en[2] | vv_rd_en[3];
    assign v_phy_release = vv_phy_release[0] | vv_phy_release[1] | vv_phy_release[2] | vv_phy_release[3];
    assign v_phy_back_ref = vv_phy_back_ref[0] | vv_phy_back_ref[1] | vv_phy_back_ref[2] | vv_phy_back_ref[3];
    assign v_phy_release_comb = vv_phy_release_comb[0] | vv_phy_release_comb[1] | vv_phy_release_comb[2] ;
    generate
        for(genvar j=0;j<PHY_REG_NUM;j=j+1)begin
            for(genvar i=0;i<COMMIT_REL_CHANNEL;i=i+1)begin
                assign vv_phy_release[i][j] = v_phy_release_en[i] && (v_phy_release_index[i] == j);
                assign vv_phy_back_ref[i][j] = v_phy_release_en[i] && (v_phy_backup_index[i] == j);
                if(i<3)begin
                    assign vv_phy_release_comb[i][j] = v_phy_release_comb_en[i] && (v_phy_release_comb_index[i] == j);
                end
            end
        end

        for(genvar j=0;j<ARCH_ENTRY_NUM;j=j+1)begin
            for(genvar i=0;i<COMMIT_REL_CHANNEL;i=i+1)begin
                if(MODE==0)begin
                    assign vv_rd_en[i][j] = (v_commit_pld[i].commit_common_pld.arch_reg_index == j) && v_commit_pld[i].commit_common_pld.rd_en && v_commit_en[i];
                end
                else begin
                    assign vv_rd_en[i][j] = (v_commit_pld[i].commit_common_pld.arch_reg_index == j) && v_commit_pld[i].commit_common_pld.fp_rd_en && v_commit_en[i];
                end
            end
            assign v_commit_phy_index[j] =  vv_rd_en[3][j] ? v_commit_pld[3].commit_common_pld.phy_reg_index:
                                            vv_rd_en[2][j] ? v_commit_pld[2].commit_common_pld.phy_reg_index:
                                            vv_rd_en[1][j] ? v_commit_pld[1].commit_common_pld.phy_reg_index:
                                            v_commit_pld[0].commit_common_pld.phy_reg_index;


            toy_backup_rename_regfile_entry #(
                .ARCH_REG_ID(j),
                .MODE       (MODE)
            )u_toy_backup_rename_regfile_entry(
                .clk                    (clk                            ),
                .rst_n                  (rst_n                          ),
                .commit_en              (v_rd_en[j]                     ),
                .commit_phy_index       (v_commit_phy_index[j]          ),
                .reg_phy_id             (v_reg_phy_id[j]                )
            );

        end       

    //##############################################
    // look up id
    //############################################## 

        assign v_phy_release_comb_en[0] =   v_phy_release_en[0] && 
                                           (((v_commit_pld[0].commit_common_pld.arch_reg_index == v_commit_pld[1].commit_common_pld.arch_reg_index) && (v_phy_release_en[1])) || 
                                            ((v_commit_pld[0].commit_common_pld.arch_reg_index == v_commit_pld[2].commit_common_pld.arch_reg_index) && (v_phy_release_en[2])) || 
                                            ((v_commit_pld[0].commit_common_pld.arch_reg_index == v_commit_pld[3].commit_common_pld.arch_reg_index) && (v_phy_release_en[3])))   ;
        assign v_phy_release_comb_en[1] =   v_phy_release_en[1] && 
                                           (((v_commit_pld[1].commit_common_pld.arch_reg_index == v_commit_pld[2].commit_common_pld.arch_reg_index) && (v_phy_release_en[2])) || 
                                            ((v_commit_pld[1].commit_common_pld.arch_reg_index == v_commit_pld[3].commit_common_pld.arch_reg_index) && (v_phy_release_en[3])))   ;
        assign v_phy_release_comb_en[2] =   v_phy_release_en[2] && 
                                           (((v_commit_pld[2].commit_common_pld.arch_reg_index == v_commit_pld[3].commit_common_pld.arch_reg_index) && (v_phy_release_en[3])))   ;

        for (genvar k = 0;k < COMMIT_REL_CHANNEL;k = k + 1 ) begin:PHY_REG_
            assign v_phy_backup_index[k] = v_commit_pld[k].commit_common_pld.phy_reg_index;
            assign v_phy_release_index[k] = v_reg_phy_id[v_commit_pld[k].commit_common_pld.arch_reg_index];
            if(MODE==0)begin
                assign v_phy_release_en[k] = v_commit_en[k] & v_commit_pld[k].commit_common_pld.rd_en;
            end
            else begin
                assign v_phy_release_en[k] = v_commit_en[k] & v_commit_pld[k].commit_common_pld.fp_rd_en;
            end
            if(k<3)begin
                assign v_phy_release_comb_index[k] = v_commit_pld[k].commit_common_pld.phy_reg_index;
            end
        end


    endgenerate








endmodule