
module toy_rename
    import toy_pack::*;
    (
        input  logic                                clk                     ,
        input  logic                                rst_n                   ,
        // pre-alloc int buffer
        input  logic   [INST_DECODE_NUM-1   :0]     v_pre_allocate_int_vld  ,
        output logic   [INST_DECODE_NUM-1   :0]     v_pre_allocate_int_rdy_withoutzero  ,
        input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_pre_allocate_int_id   [INST_DECODE_NUM-1:0],
        // pre-alloc fp buffer
        input  logic   [INST_DECODE_NUM-1   :0]     v_pre_allocate_fp_vld   ,
        output logic   [INST_DECODE_NUM-1   :0]     v_pre_allocate_fp_rdy   ,
        input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_pre_allocate_fp_id    [INST_DECODE_NUM-1:0],
        // decode out 
        input  logic   [INST_DECODE_NUM-1   :0]     v_decode_vld            ,
        output logic   [INST_DECODE_NUM-1   :0]     v_decode_rdy            ,
        input  decode_pkg                           v_decode_pld            [INST_DECODE_NUM-1:0],
        // backup rename 
        input  logic                                cancel_en               ,
        input  logic                                cancel_edge_en_d        ,
        input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_int_backup_phy_id     [ARCH_ENTRY_NUM-1 :0],
        input  logic   [PHY_REG_ID_WIDTH-1  :0]     v_fp_backup_phy_id      [ARCH_ENTRY_NUM-1 :0],
        // rename output
        output logic   [INST_DECODE_NUM-1   :0]     v_rename_vld            ,
        input  logic   [INST_DECODE_NUM-1   :0]     v_rename_rdy            ,
        output rename_pkg                           v_rename_pld            [INST_DECODE_NUM-1:0],
        output decode_commit_bp_pkg                 v_decode_commit_bp_pld  [INST_DECODE_NUM-1:0]
    );
    //##############################################
    // logic 
    //############################################## 
    logic   [INST_DECODE_NUM-1      :0]     v_merge_vld                                 ;
    logic   [INST_DECODE_NUM-1      :0]     v_merge_rdy                                 ;
    logic   [INST_DECODE_NUM-1      :0]     v_pre_allocate_zero                         ;
    logic   [INST_DECODE_NUM-1      :0]     v_pre_allocate_int_rdy                      ;
    logic   [LSU_DEPTH_WIDTH        :0]     lsu_idx_reg                                 ;
    logic   [LSU_DEPTH_WIDTH        :0]     lsu_idx_last                                ;
    logic   [INST_DECODE_NUM-1      :0]     v_lsu_cnt_en                                ;
    logic   [INST_DECODE_NUM-1      :0]     v_int_pre_en                                ;
    logic   [INST_DECODE_NUM-1      :0]     v_fp_pre_en                                 ;
    logic   [LSU_DEPTH_WIDTH        :0]     v_lsu_id            [INST_DECODE_NUM-1:0]   ;
    logic   [LSU_DEPTH_WIDTH        :0]     v_lsu_id_pre        [INST_DECODE_NUM-1:0]   ;
    logic   [4                      :0]     v_rd_index          [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_phy_reg_int_id    [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_phy_reg_fp_id     [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_int_phy_id        [ARCH_ENTRY_NUM-1 :0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_fp_phy_id         [ARCH_ENTRY_NUM-1 :0]   ;
    logic   [1                      :0]     v_int_rs1_sel       [INST_DECODE_NUM-1:0]   ;
    logic   [1                      :0]     v_int_rs2_sel       [INST_DECODE_NUM-1:0]   ;
    logic   [1                      :0]     v_fp_rs1_sel        [INST_DECODE_NUM-1:0]   ;
    logic   [1                      :0]     v_fp_rs2_sel        [INST_DECODE_NUM-1:0]   ;
    logic   [1                      :0]     v_fp_rs3_sel        [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_int_rs1_phy       [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_int_rs2_phy       [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_fp_rs1_phy        [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_fp_rs2_phy        [INST_DECODE_NUM-1:0]   ;
    logic   [PHY_REG_ID_WIDTH-1     :0]     v_fp_rs3_phy        [INST_DECODE_NUM-1:0]   ;
    //##############################################
    // merge
    //############################################## 

    assign v_merge_vld              = v_decode_vld & v_pre_allocate_int_vld & v_pre_allocate_fp_vld; // for in order, must both fp&int credit
    assign v_merge_rdy              = v_rename_rdy;
    assign v_decode_rdy             = v_merge_vld & v_merge_rdy;

    generate
        for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
        // int reg file index-0 always 0
            assign v_rd_index[i]            = v_decode_pld[i].inst_rd; 
            assign v_pre_allocate_zero[i]   = (v_rd_index[i]==0)     ; 
            assign v_phy_reg_int_id[i]      = (v_rd_index[i]==0) ? 0 : v_pre_allocate_int_id[i]; 
            assign v_phy_reg_fp_id[i]       = v_pre_allocate_fp_id[i]; 
            assign v_int_pre_en[i]          = v_merge_vld[i] & v_decode_pld[i].inst_rd_en; 
            assign v_fp_pre_en[i]           = v_merge_vld[i] & v_decode_pld[i].inst_fp_rd_en;         
        // pre alloc ready
            assign v_pre_allocate_fp_rdy[i] = v_merge_vld[i] & v_merge_rdy[i] & v_decode_pld[i].inst_fp_rd_en; 
            assign v_pre_allocate_int_rdy[i]= v_merge_vld[i] & v_merge_rdy[i] & v_decode_pld[i].inst_rd_en;         
            assign v_pre_allocate_int_rdy_withoutzero[i]= v_pre_allocate_int_rdy[i] & ~v_pre_allocate_zero[i];         
        end
    endgenerate

    //##############################################
    // rename table - int
    //############################################## 

    toy_rename_regfile u_rename_reg_file(
        .clk                 (clk                       ),
        .rst_n               (rst_n                     ),
        .v_int_pre_en        (v_int_pre_en              ),
        .v_fp_pre_en         (v_fp_pre_en               ),
        .v_int_rd_en         (v_pre_allocate_int_rdy    ),
        .v_int_rd_allocate_id(v_phy_reg_int_id          ),
        .v_fp_rd_en          (v_pre_allocate_fp_rdy     ),
        .v_fp_rd_allocate_id (v_pre_allocate_fp_id      ),
        .v_rd_index          (v_rd_index                ),
        .cancel_edge_en_d    (cancel_edge_en_d          ),
        .v_int_backup_phy_id (v_int_backup_phy_id       ),
        .v_fp_backup_phy_id  (v_fp_backup_phy_id        ),
        .v_int_phy_id        (v_int_phy_id              ),
        .v_fp_phy_id         (v_fp_phy_id               )
    );
    //##############################################
    // compare comb logic - int
    //############################################## 
    assign v_int_rs1_sel[0] = ARCH_RF;
    assign v_int_rs1_sel[1] = (v_decode_pld[1].reg_rs1==v_decode_pld[0].inst_rd && v_decode_pld[1].use_rs1_en && v_decode_pld[0].inst_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_int_rs1_sel[2] = (v_decode_pld[2].reg_rs1==v_decode_pld[1].inst_rd && v_decode_pld[2].use_rs1_en && v_decode_pld[1].inst_rd_en) ? PHY_RD1 : 
                              (v_decode_pld[2].reg_rs1==v_decode_pld[0].inst_rd && v_decode_pld[2].use_rs1_en && v_decode_pld[0].inst_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_int_rs1_sel[3] = (v_decode_pld[3].reg_rs1==v_decode_pld[2].inst_rd && v_decode_pld[3].use_rs1_en && v_decode_pld[2].inst_rd_en) ? PHY_RD2 : 
                              (v_decode_pld[3].reg_rs1==v_decode_pld[1].inst_rd && v_decode_pld[3].use_rs1_en && v_decode_pld[1].inst_rd_en) ? PHY_RD1 : 
                              (v_decode_pld[3].reg_rs1==v_decode_pld[0].inst_rd && v_decode_pld[3].use_rs1_en && v_decode_pld[0].inst_rd_en) ? PHY_RD0 : ARCH_RF;

    assign v_int_rs2_sel[0] = ARCH_RF;
    assign v_int_rs2_sel[1] = (v_decode_pld[1].reg_rs2==v_decode_pld[0].inst_rd && v_decode_pld[1].use_rs2_en && v_decode_pld[0].inst_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_int_rs2_sel[2] = (v_decode_pld[2].reg_rs2==v_decode_pld[1].inst_rd && v_decode_pld[2].use_rs2_en && v_decode_pld[1].inst_rd_en) ? PHY_RD1 : 
                              (v_decode_pld[2].reg_rs2==v_decode_pld[0].inst_rd && v_decode_pld[2].use_rs2_en && v_decode_pld[0].inst_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_int_rs2_sel[3] = (v_decode_pld[3].reg_rs2==v_decode_pld[2].inst_rd && v_decode_pld[3].use_rs2_en && v_decode_pld[2].inst_rd_en) ? PHY_RD2 : 
                              (v_decode_pld[3].reg_rs2==v_decode_pld[1].inst_rd && v_decode_pld[3].use_rs2_en && v_decode_pld[1].inst_rd_en) ? PHY_RD1 : 
                              (v_decode_pld[3].reg_rs2==v_decode_pld[0].inst_rd && v_decode_pld[3].use_rs2_en && v_decode_pld[0].inst_rd_en) ? PHY_RD0 : ARCH_RF;


    //##############################################
    // compare comb logic - fp
    //############################################## 
    assign v_fp_rs1_sel[0] = ARCH_RF;
    assign v_fp_rs1_sel[1] = (v_decode_pld[1].reg_rs1==v_decode_pld[0].inst_rd && v_decode_pld[1].use_rs1_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_fp_rs1_sel[2] = (v_decode_pld[2].reg_rs1==v_decode_pld[1].inst_rd && v_decode_pld[2].use_rs1_fp_en && v_decode_pld[1].inst_fp_rd_en) ? PHY_RD1 : 
                             (v_decode_pld[2].reg_rs1==v_decode_pld[0].inst_rd && v_decode_pld[2].use_rs1_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_fp_rs1_sel[3] = (v_decode_pld[3].reg_rs1==v_decode_pld[2].inst_rd && v_decode_pld[3].use_rs1_fp_en && v_decode_pld[2].inst_fp_rd_en) ? PHY_RD2 : 
                             (v_decode_pld[3].reg_rs1==v_decode_pld[1].inst_rd && v_decode_pld[3].use_rs1_fp_en && v_decode_pld[1].inst_fp_rd_en) ? PHY_RD1 : 
                             (v_decode_pld[3].reg_rs1==v_decode_pld[0].inst_rd && v_decode_pld[3].use_rs1_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;

    assign v_fp_rs2_sel[0] = ARCH_RF;
    assign v_fp_rs2_sel[1] = (v_decode_pld[1].reg_rs2==v_decode_pld[0].inst_rd && v_decode_pld[1].use_rs2_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_fp_rs2_sel[2] = (v_decode_pld[2].reg_rs2==v_decode_pld[1].inst_rd && v_decode_pld[2].use_rs2_fp_en && v_decode_pld[1].inst_fp_rd_en) ? PHY_RD1 : 
                             (v_decode_pld[2].reg_rs2==v_decode_pld[0].inst_rd && v_decode_pld[2].use_rs2_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_fp_rs2_sel[3] = (v_decode_pld[3].reg_rs2==v_decode_pld[2].inst_rd && v_decode_pld[3].use_rs2_fp_en && v_decode_pld[2].inst_fp_rd_en) ? PHY_RD2 : 
                             (v_decode_pld[3].reg_rs2==v_decode_pld[1].inst_rd && v_decode_pld[3].use_rs2_fp_en && v_decode_pld[1].inst_fp_rd_en) ? PHY_RD1 : 
                             (v_decode_pld[3].reg_rs2==v_decode_pld[0].inst_rd && v_decode_pld[3].use_rs2_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;

    assign v_fp_rs3_sel[0] = ARCH_RF;
    assign v_fp_rs3_sel[1] = (v_decode_pld[1].reg_rs3==v_decode_pld[0].inst_rd && v_decode_pld[1].use_rs3_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_fp_rs3_sel[2] = (v_decode_pld[2].reg_rs3==v_decode_pld[1].inst_rd && v_decode_pld[2].use_rs3_fp_en && v_decode_pld[1].inst_fp_rd_en) ? PHY_RD1 : 
                             (v_decode_pld[2].reg_rs3==v_decode_pld[0].inst_rd && v_decode_pld[2].use_rs3_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;
    assign v_fp_rs3_sel[3] = (v_decode_pld[3].reg_rs3==v_decode_pld[2].inst_rd && v_decode_pld[3].use_rs3_fp_en && v_decode_pld[2].inst_fp_rd_en) ? PHY_RD2 : 
                             (v_decode_pld[3].reg_rs3==v_decode_pld[1].inst_rd && v_decode_pld[3].use_rs3_fp_en && v_decode_pld[1].inst_fp_rd_en) ? PHY_RD1 : 
                             (v_decode_pld[3].reg_rs3==v_decode_pld[0].inst_rd && v_decode_pld[3].use_rs3_fp_en && v_decode_pld[0].inst_fp_rd_en) ? PHY_RD0 : ARCH_RF;

    //##############################################
    // mux arch or comb
    //############################################## 

    generate
        for(genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
            always_comb begin
                case (v_int_rs1_sel[i])
                    ARCH_RF: v_int_rs1_phy[i] = v_int_phy_id[v_decode_pld[i].reg_rs1]; 
                    PHY_RD0: v_int_rs1_phy[i] = v_phy_reg_int_id[0];
                    PHY_RD1: v_int_rs1_phy[i] = v_phy_reg_int_id[1];
                    PHY_RD2: v_int_rs1_phy[i] = v_phy_reg_int_id[2];
                    default: v_int_rs1_phy[i] = 0;
                endcase
            end
            always_comb begin
                case (v_int_rs2_sel[i])
                    ARCH_RF: v_int_rs2_phy[i] = v_int_phy_id[v_decode_pld[i].reg_rs2]; 
                    PHY_RD0: v_int_rs2_phy[i] = v_phy_reg_int_id[0];
                    PHY_RD1: v_int_rs2_phy[i] = v_phy_reg_int_id[1];
                    PHY_RD2: v_int_rs2_phy[i] = v_phy_reg_int_id[2];
                    default: v_int_rs2_phy[i] = 0;
                endcase
            end

            always_comb begin
                case (v_fp_rs1_sel[i])
                    ARCH_RF: v_fp_rs1_phy[i] = v_fp_phy_id[v_decode_pld[i].reg_rs1]; 
                    PHY_RD0: v_fp_rs1_phy[i] = v_phy_reg_fp_id[0];
                    PHY_RD1: v_fp_rs1_phy[i] = v_phy_reg_fp_id[1];
                    PHY_RD2: v_fp_rs1_phy[i] = v_phy_reg_fp_id[2];
                    default: v_fp_rs1_phy[i] = 0;
                endcase
            end
            always_comb begin
                case (v_fp_rs2_sel[i])
                    ARCH_RF: v_fp_rs2_phy[i] = v_fp_phy_id[v_decode_pld[i].reg_rs2]; 
                    PHY_RD0: v_fp_rs2_phy[i] = v_phy_reg_fp_id[0];
                    PHY_RD1: v_fp_rs2_phy[i] = v_phy_reg_fp_id[1];
                    PHY_RD2: v_fp_rs2_phy[i] = v_phy_reg_fp_id[2];
                    default: v_fp_rs2_phy[i] = 0;
                endcase
            end
            always_comb begin
                case (v_fp_rs3_sel[i])
                    ARCH_RF: v_fp_rs3_phy[i] = v_fp_phy_id[v_decode_pld[i].reg_rs3]; 
                    PHY_RD0: v_fp_rs3_phy[i] = v_phy_reg_fp_id[0];
                    PHY_RD1: v_fp_rs3_phy[i] = v_phy_reg_fp_id[1];
                    PHY_RD2: v_fp_rs3_phy[i] = v_phy_reg_fp_id[2];
                    default: v_fp_rs3_phy[i] = 0;
                endcase
            end
        end
    endgenerate

    //##############################################
    // lsu id
    //############################################## 
    generate
        for (genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
            assign v_lsu_id_pre[i] = lsu_idx_reg + i + 1;
            assign v_lsu_cnt_en[i] = v_rename_vld[i] & v_rename_rdy[i] & v_decode_pld[i].goto_lsu;
        end
    endgenerate
    always_comb begin
        v_lsu_id[0]  = lsu_idx_reg;
        v_lsu_id[1]  = lsu_idx_reg;
        v_lsu_id[2]  = lsu_idx_reg;
        v_lsu_id[3]  = lsu_idx_reg;
        lsu_idx_last = lsu_idx_reg;
        case (v_lsu_cnt_en)
            4'b0001: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                lsu_idx_last = v_lsu_id_pre[0];
            end
            4'b0010: begin
                v_lsu_id[1]  = v_lsu_id_pre[0];
                lsu_idx_last = v_lsu_id_pre[0];
            end
            4'b0011: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[1]  = v_lsu_id_pre[1];
                lsu_idx_last = v_lsu_id_pre[1];
            end
            4'b0100: begin
                v_lsu_id[2]  = v_lsu_id_pre[0];
                lsu_idx_last = v_lsu_id_pre[0];
            end
            4'b0101: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[2]  = v_lsu_id_pre[1];
                lsu_idx_last = v_lsu_id_pre[1];
            end
            4'b0110: begin
                v_lsu_id[1]  = v_lsu_id_pre[0];
                v_lsu_id[2]  = v_lsu_id_pre[1];
                lsu_idx_last = v_lsu_id_pre[1];
            end
            4'b0111: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[1]  = v_lsu_id_pre[1];
                v_lsu_id[2]  = v_lsu_id_pre[2];
                lsu_idx_last = v_lsu_id_pre[2];
            end
            4'b1000: begin
                v_lsu_id[3]  = v_lsu_id_pre[0];
                lsu_idx_last = v_lsu_id_pre[0];
            end
            4'b1001: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[3]  = v_lsu_id_pre[1];
                lsu_idx_last = v_lsu_id_pre[1];
            end
            4'b1010: begin
                v_lsu_id[1]  = v_lsu_id_pre[0];
                v_lsu_id[3]  = v_lsu_id_pre[1];
                lsu_idx_last = v_lsu_id_pre[1];
            end
            4'b1011: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[1]  = v_lsu_id_pre[1];
                v_lsu_id[3]  = v_lsu_id_pre[2];
                lsu_idx_last = v_lsu_id_pre[2];
            end
            4'b1100: begin
                v_lsu_id[2]  = v_lsu_id_pre[0];
                v_lsu_id[3]  = v_lsu_id_pre[1];
                lsu_idx_last = v_lsu_id_pre[1];
            end
            4'b1101: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[2]  = v_lsu_id_pre[1];
                v_lsu_id[3]  = v_lsu_id_pre[2];
                lsu_idx_last = v_lsu_id_pre[2];
            end
            4'b1110: begin
                v_lsu_id[1]  = v_lsu_id_pre[0];
                v_lsu_id[2]  = v_lsu_id_pre[1];
                v_lsu_id[3]  = v_lsu_id_pre[2];
                lsu_idx_last = v_lsu_id_pre[2];
            end
            4'b1111: begin
                v_lsu_id[0]  = v_lsu_id_pre[0];
                v_lsu_id[1]  = v_lsu_id_pre[1];
                v_lsu_id[2]  = v_lsu_id_pre[2];
                v_lsu_id[3]  = v_lsu_id_pre[3];
                lsu_idx_last = v_lsu_id_pre[3];
            end
        endcase
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            lsu_idx_reg <= 0-1;
        end
        else if(cancel_en)begin
            lsu_idx_reg <= 0-1;
        end
        else begin
            lsu_idx_reg <= lsu_idx_last ;
        end
    end

    //##############################################
    // mux int or fp && output
    //############################################## 

    assign v_rename_vld = v_decode_vld & v_pre_allocate_int_vld & v_pre_allocate_fp_vld;// for in order, must both fp&int credit
    generate
        for (genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
            assign v_rename_pld[i].phy_rs1 = v_decode_pld[i].use_rs1_en ? v_int_rs1_phy[i] : v_fp_rs1_phy[i];
            assign v_rename_pld[i].phy_rs2 = v_decode_pld[i].use_rs2_en ? v_int_rs2_phy[i] : v_fp_rs2_phy[i];
            assign v_rename_pld[i].phy_rs3 = v_fp_rs3_phy[i];
            assign v_rename_pld[i].phy_rd  = v_decode_pld[i].inst_rd_en ? v_phy_reg_int_id[i] : v_pre_allocate_fp_id[i];
            
            assign v_rename_pld[i].inst_pld         = v_decode_pld[i].inst_pld     ;
            assign v_rename_pld[i].inst_id          = v_decode_pld[i].inst_id      ;

            assign v_rename_pld[i].inst_rd          = v_decode_pld[i].inst_rd      ;
            assign v_rename_pld[i].inst_rd_en       = v_decode_pld[i].inst_rd_en   ;
            assign v_rename_pld[i].inst_fp_rd_en    = v_decode_pld[i].inst_fp_rd_en;
            assign v_rename_pld[i].c_ext            = v_decode_pld[i].c_ext        ;
            assign v_rename_pld[i].inst_pc          = v_decode_pld[i].inst_pc      ;

            assign v_rename_pld[i].inst_imm         = v_decode_pld[i].inst_imm     ;
            assign v_rename_pld[i].use_rs1_fp_en    = v_decode_pld[i].use_rs1_fp_en;
            assign v_rename_pld[i].use_rs2_fp_en    = v_decode_pld[i].use_rs2_fp_en;
            assign v_rename_pld[i].use_rs3_fp_en    = v_decode_pld[i].use_rs3_fp_en;
            assign v_rename_pld[i].use_rs1_en       = v_decode_pld[i].use_rs1_en   ;
            assign v_rename_pld[i].use_rs2_en       = v_decode_pld[i].use_rs2_en   ;
            assign v_rename_pld[i].goto_lsu         = v_decode_pld[i].goto_lsu     ;
            assign v_rename_pld[i].goto_ldu         = v_decode_pld[i].goto_ldu     ;
            assign v_rename_pld[i].goto_stu         = v_decode_pld[i].goto_stu     ;
            assign v_rename_pld[i].goto_alu         = v_decode_pld[i].goto_alu     ;
            assign v_rename_pld[i].goto_err         = v_decode_pld[i].goto_err     ;
            assign v_rename_pld[i].goto_mext        = v_decode_pld[i].goto_mext    ;
            assign v_rename_pld[i].goto_csr         = v_decode_pld[i].goto_csr     ;
            assign v_rename_pld[i].goto_float       = v_decode_pld[i].goto_float   ;
            assign v_rename_pld[i].goto_custom      = v_decode_pld[i].goto_custom  ;
            assign v_rename_pld[i].lsu_id           = v_lsu_id[i]                  ;
            assign v_rename_pld[i].fe_bypass_pld    = v_decode_pld[i].fe_bypass_pld;
        end
    endgenerate

    //##############################################
    // decode create for bp commit
    //############################################## 
    logic   [ADDR_WIDTH-1       :0]     full_offset[INST_DECODE_NUM-1:0];
    logic   [INST_DECODE_NUM-1  :0]     lsu_taken_pend                  ;
    logic   [INST_DECODE_NUM-1  :0]     normal_taken_pend               ;
    logic   [INST_DECODE_NUM-1  :0]     lsu_taken                       ;
    logic   [INST_DECODE_NUM-1  :0]     normal_taken                    ;
    
    generate
        for (genvar i=0;i<INST_DECODE_NUM;i=i+1)begin
            assign full_offset[i]                                               = v_decode_pld[i].inst_pc - v_decode_pld[i].fe_bypass_pld.pred_pc;
            assign v_decode_commit_bp_pld[i].inst_id                            = v_decode_pld[i].inst_id                      ;
            assign lsu_taken[i]                                                 = (full_offset[i]>>2)!=(4'd7-(v_decode_pld[i].fe_bypass_pld.pred_pc[ALIGN_WIDTH-1:0]>>2));
            assign normal_taken[i]                                              = v_decode_pld[i].c_ext 
                                                                                  ? (v_decode_commit_bp_pld[i].commit_bp_branch_pld.inst_nxt_pc - v_decode_pld[i].inst_pc)!=2
                                                                                  : (((v_decode_commit_bp_pld[i].commit_bp_branch_pld.inst_nxt_pc - v_decode_pld[i].inst_pc)!=4) || (full_offset[i]>>2)!=(4'd7-(v_decode_pld[i].fe_bypass_pld.pred_pc[ALIGN_WIDTH-1:0]>>2)));      
            assign lsu_taken_pend[i]                                            = v_decode_commit_bp_pld[i].commit_bp_branch_pld.commit_error || v_decode_commit_bp_pld[i].commit_bp_branch_pld.taken;
            assign normal_taken_pend[i]                                         = v_decode_commit_bp_pld[i].commit_bp_branch_pld.commit_error ? (v_decode_pld[i].c_ext 
                                                                                  ? (v_decode_commit_bp_pld[i].commit_bp_branch_pld.inst_nxt_pc - v_decode_pld[i].inst_pc)==2
                                                                                  : (((v_decode_commit_bp_pld[i].commit_bp_branch_pld.inst_nxt_pc - v_decode_pld[i].inst_pc)==4) && (full_offset[i]>>2)!=(4'd7-(v_decode_pld[i].fe_bypass_pld.pred_pc[ALIGN_WIDTH-1:0]>>2)))) : 1'b0;

            // commit_common_pkg
            assign v_decode_commit_bp_pld[i].commit_common_pld.is_cext          = v_decode_pld[i].c_ext                        ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.is_call          = (v_decode_pld[i].goto_lsu || v_decode_pld[i].goto_float) ? 1'b0 : (({v_decode_pld[i].inst_pld[14:12],v_decode_pld[i].inst_pld[6:0]} == 10'b000_1100111) && ((v_decode_pld[i].inst_pld[11:7] == 5'b00001) || (v_decode_pld[i].inst_pld[11:7] == 5'b00101))) //jalr
                                                                                  || ((v_decode_pld[i].inst_pld[6:0] == 7'b1101111) && ((v_decode_pld[i].inst_pld[11:7] == 5'b00001) || (v_decode_pld[i].inst_pld[11:7] == 5'b00101)))                         //jal 
                                                                                  || (({v_decode_pld[i].inst_pld[15:12],v_decode_pld[i].inst_pld[6:0]} == 11'b1001_00000_10) && (v_decode_pld[i].inst_pld[11:7] != 5'b0));                                     //c.jalr
            assign v_decode_commit_bp_pld[i].commit_common_pld.is_ret           = (v_decode_pld[i].goto_lsu || v_decode_pld[i].goto_float) ? 1'b0 :(({v_decode_pld[i].inst_pld[14:12],v_decode_pld[i].inst_pld[6:0]} == 10'b000_1100111) && (v_decode_pld[i].inst_pld[11:7] != v_decode_pld[i].inst_pld[19:15]) && ((v_decode_pld[i].inst_pld[19:15] == 5'b00001) || (v_decode_pld[i].inst_pld[19:15] == 5'b00101)) && (v_decode_pld[i].inst_pld[31:20] == 12'b0)) //jalr
                                                                                  || (({v_decode_pld[i].inst_pld[15:12],v_decode_pld[i].inst_pld[6:0]} == 11'b1000_00000_10) && ((v_decode_pld[i].inst_pld[11:7] == 5'b00001) || (v_decode_pld[i].inst_pld[11:7] == 5'b00101)) && (v_decode_pld[i].inst_pld[11:7] != 5'b00000))                                        //jalr
                                                                                  || (({v_decode_pld[i].inst_pld[15:12],v_decode_pld[i].inst_pld[6:0]} == 11'b1001_00000_10) && (v_decode_pld[i].inst_pld[11:7] == 5'b00101));                                ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.pred_pc          = v_decode_pld[i].fe_bypass_pld.pred_pc        ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.carry            = full_offset[1]                               ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.rd_en            = v_decode_pld[i].inst_rd_en                   ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.fp_rd_en         = v_decode_pld[i].inst_fp_rd_en                ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.inst_pc          = v_decode_pld[i].inst_pc                      ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.inst_val         = v_decode_pld[i].inst_pld                     ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.arch_reg_index   = v_decode_pld[i].inst_rd                      ;
            assign v_decode_commit_bp_pld[i].commit_common_pld.phy_reg_index    = v_decode_pld[i].inst_rd_en ? v_phy_reg_int_id[i] : v_pre_allocate_fp_id[i];                      
            // commit_bp_branch_pkg
            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.inst_nxt_pc   = v_decode_pld[i].c_ext ? v_decode_pld[i].inst_pc+2 : v_decode_pld[i].inst_pc+4;
            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.commit_error  = v_decode_commit_bp_pld[i].commit_bp_branch_pld.inst_nxt_pc != v_decode_pld[i].fe_bypass_pld.tgt_pc;
            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.offset        = v_decode_commit_bp_pld[i].commit_bp_branch_pld.commit_error ? (full_offset[i]>>2) : v_decode_pld[i].fe_bypass_pld.offset;            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.taken         =  v_decode_pld[i].goto_lsu ? lsu_taken[i] : normal_taken[i];
            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.is_last       = v_decode_commit_bp_pld[i].commit_bp_branch_pld.commit_error ? 1'b1 : v_decode_pld[i].fe_bypass_pld.is_last        ;          
            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.taken_err     = v_decode_commit_bp_pld[i].commit_bp_branch_pld.taken ^ v_decode_pld[i].fe_bypass_pld.taken;
            assign v_decode_commit_bp_pld[i].commit_bp_branch_pld.taken_pend    = v_decode_pld[i].goto_lsu ? lsu_taken_pend[i] : normal_taken_pend[i];

            assign v_decode_commit_bp_pld[i].fp_commit_en                       = v_decode_pld[i].goto_float                   ;
            assign v_decode_commit_bp_pld[i].store_commit_en                    = v_decode_pld[i].goto_stu                     ;
        end
    endgenerate

    `ifdef TOY_SIM


        logic [INST_DECODE_NUM-1:0] v_monitor_phy_lock;
        assign v_monitor_phy_lock = v_decode_vld & (~v_pre_allocate_int_vld | ~v_pre_allocate_fp_vld);
        logic [31:0] fetch_entry_cnt [3:0];
        generate
            for(genvar a=0;a<4;a=a+1)begin
                always_ff @(posedge clk or negedge rst_n) begin:FETCH_ENTRY_CNT_FOR_SIM
                    if(~rst_n)begin
                        fetch_entry_cnt[a] <= 32'b0;
                    end
                    else if(v_decode_vld[a] && v_decode_rdy[a])begin
                        fetch_entry_cnt[a] <= fetch_entry_cnt[a] + 1'b1;
                    end
                end
            end
        endgenerate

        logic [31:0] fetch_0_cnt;
        always_ff @(posedge clk or negedge rst_n) begin
            if(~rst_n)begin
                fetch_0_cnt <= 32'b0;
            end
            else if(~|(v_decode_vld & v_decode_rdy))begin
                fetch_0_cnt <= fetch_0_cnt + 1'b1;
            end
            
        end

    `endif

endmodule



