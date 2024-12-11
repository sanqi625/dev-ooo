

module toy_dispatch_crossbar
    import toy_pack::*;
(
    input  logic                                 clk                     ,
    input  logic                                 rst_n                   ,

    input  logic [OOO_DEPTH-1           :0]      v_issue_en              ,
    input  issue_pkg                             v_issue_pld             [OOO_DEPTH-1        :0],

    output logic                                 mext_instruction_vld    ,
    output eu_pkg                                mext_pld                ,
    output logic                                 float_instruction_vld   ,
    output eu_pkg                                float_pld               ,
    output logic                                 csr_instruction_vld     ,
    output eu_pkg                                csr_pld                 ,
    output logic                                 custom_instruction_vld  ,
    output eu_pkg                                custom_pld

);
    //##############################################
    // logic 
    //############################################## 
    logic [OOO_DEPTH-1    :0]     onehot_mext             ;
    logic [OOO_DEPTH-1    :0]     onehot_float            ;
    logic [OOO_DEPTH-1    :0]     onehot_csr              ;
    logic [OOO_DEPTH-1    :0]     onehot_custom           ;
    //##############################################
    // package
    //############################################## 
    eu_pkg v_mext_pld       [OOO_DEPTH-1    :0]           ;
    eu_pkg v_float_pld      [OOO_DEPTH-1    :0]           ;
    eu_pkg v_csr_pld        [OOO_DEPTH-1    :0]           ;
    eu_pkg v_custom_pld     [OOO_DEPTH-1    :0]           ;
    eu_pkg v_mext_pld_arb   [OOO_DEPTH-1    :0]           ;
    eu_pkg v_float_pld_arb  [OOO_DEPTH-1    :0]           ;
    eu_pkg v_csr_pld_arb    [OOO_DEPTH-1    :0]           ;
    eu_pkg v_custom_pld_arb [OOO_DEPTH-1    :0]           ;
    eu_pkg v_mext_pld_or    [OOO_DEPTH-1    :0]           ;
    eu_pkg v_float_pld_or   [OOO_DEPTH-1    :0]           ;
    eu_pkg v_csr_pld_or     [OOO_DEPTH-1    :0]           ;
    eu_pkg v_custom_pld_or  [OOO_DEPTH-1    :0]           ;

    //##############################################
    // package logic
    //############################################## 
    // assign lsu_pld               = v_lsu_pld_or[OOO_DEPTH-1]      ;
    assign mext_pld              = v_mext_pld_or[OOO_DEPTH-1]     ;
    assign float_pld             = v_float_pld_or[OOO_DEPTH-1]    ;
    assign csr_pld               = v_csr_pld_or[OOO_DEPTH-1]      ;
    assign custom_pld            = v_custom_pld_or[OOO_DEPTH-1]   ;

    // assign lsu_instruction_vld   = |onehot_lsu                          ;
    assign mext_instruction_vld  = |onehot_mext                         ;
    assign float_instruction_vld = |onehot_float                        ;
    assign csr_instruction_vld   = |onehot_csr                          ;
    assign custom_instruction_vld= |onehot_custom                       ;
    //##############################################
    // cross bar
    //############################################## 
    generate
        for (genvar i=0;i<OOO_DEPTH;i=i+1)begin : DECODE_GEN
            if(i==0)begin
                // assign v_lsu_pld_or[0] = v_lsu_pld_arb[i];
                assign v_mext_pld_or[0] = v_mext_pld_arb[i];
                assign v_float_pld_or[0] = v_float_pld_arb[i];
                assign v_csr_pld_or[0] = v_csr_pld_arb[i];
                assign v_custom_pld_or[0] = v_custom_pld_arb[i];
            end
            else begin
                // assign v_lsu_pld_or[i] = v_lsu_pld_or[i-1] | v_lsu_pld_arb[i];
                assign v_mext_pld_or[i] = v_mext_pld_or[i-1] | v_mext_pld_arb[i];
                assign v_csr_pld_or[i] = v_csr_pld_or[i-1] | v_csr_pld_arb[i];
                assign v_custom_pld_or[i] = v_custom_pld_or[i-1] | v_custom_pld_arb[i];
                assign v_float_pld_or[i] = v_float_pld_or[i-1] | v_float_pld_arb[i];
            end

            // assign v_lsu_pld[i].inst_pld                   = v_dec_inst_pld[i]          ;
            // assign v_lsu_pld[i].inst_id                    = v_dec_inst_id[i]           ;
            // assign v_lsu_pld[i].inst_rd                    = v_dec_inst_rd_en[i] ? v_int_phy_reg_rd_index[i] : v_fp_phy_reg_rd_index[i] ;
            // assign v_lsu_pld[i].inst_rd_en                 = v_dec_inst_rd_en[i]        ;
            // assign v_lsu_pld[i].inst_fp_rd_en              = v_dec_inst_fp_rd_en[i]     ;
            // assign v_lsu_pld[i].inst_pc                    = v_dec_inst_pc[i]           ;
            // assign v_lsu_pld[i].reg_rs1_val                = v_reg_rs1_val[i]          ;
            // assign v_lsu_pld[i].reg_rs2_val                = v_use_rs2_fp_en[i] ? v_fp_reg_rs2_val[i] : v_reg_rs2_val[i];
            // assign v_lsu_pld[i].reg_rs3_val                = v_fp_reg_rs3_val[i]       ;
            // assign v_lsu_pld[i].inst_imm                   = v_dec_inst_imm[i]          ;

            assign v_mext_pld[i].inst_pld                  = v_issue_pld[i].inst_pld            ;
            assign v_mext_pld[i].inst_id                   = v_issue_pld[i].inst_id             ;
            assign v_mext_pld[i].inst_rd                   = v_issue_pld[i].phy_rd              ;
            assign v_mext_pld[i].inst_rd_en                = v_issue_pld[i].inst_rd_en          ;
            assign v_mext_pld[i].c_ext                     = v_issue_pld[i].c_ext               ;
            assign v_mext_pld[i].inst_fp_rd_en             = v_issue_pld[i].inst_fp_rd_en       ;
            assign v_mext_pld[i].arch_reg_index            = v_issue_pld[i].arch_rd             ;
            assign v_mext_pld[i].inst_pc                   = v_issue_pld[i].inst_pc             ;
            assign v_mext_pld[i].reg_rs1_val               = v_issue_pld[i].reg_rs1_val         ;
            assign v_mext_pld[i].reg_rs2_val               = v_issue_pld[i].reg_rs2_val         ;
            assign v_mext_pld[i].reg_rs3_val               = v_issue_pld[i].reg_rs3_val         ;
            assign v_mext_pld[i].inst_imm                  = v_issue_pld[i].inst_imm            ;
            assign v_mext_pld[i].rs1_forward_id            = v_issue_pld[i].rs1_forward_id      ;
            assign v_mext_pld[i].rs2_forward_id            = v_issue_pld[i].rs2_forward_id      ;
            assign v_mext_pld[i].rs3_forward_id            = v_issue_pld[i].rs3_forward_id      ;
            assign v_mext_pld[i].rs1_forward_cycle         = v_issue_pld[i].rs1_forward_cycle   ;
            assign v_mext_pld[i].rs2_forward_cycle         = v_issue_pld[i].rs2_forward_cycle   ;
            assign v_mext_pld[i].rs3_forward_cycle         = v_issue_pld[i].rs3_forward_cycle   ;
            assign v_mext_pld[i].lsu_id                    = v_issue_pld[i].lsu_id              ;
            assign v_mext_pld[i].fe_bypass_pld             = v_issue_pld[i].fe_bypass_pld       ;
            
            assign v_float_pld[i].inst_pld                  = v_issue_pld[i].inst_pld            ;
            assign v_float_pld[i].inst_id                   = v_issue_pld[i].inst_id             ;
            assign v_float_pld[i].inst_rd                   = v_issue_pld[i].phy_rd              ;
            assign v_float_pld[i].inst_rd_en                = v_issue_pld[i].inst_rd_en          ;
            assign v_float_pld[i].c_ext                     = v_issue_pld[i].c_ext               ;
            assign v_float_pld[i].inst_fp_rd_en             = v_issue_pld[i].inst_fp_rd_en       ;
            assign v_float_pld[i].arch_reg_index            = v_issue_pld[i].arch_rd             ;
            assign v_float_pld[i].inst_pc                   = v_issue_pld[i].inst_pc             ;
            assign v_float_pld[i].reg_rs1_val               = v_issue_pld[i].reg_rs1_val         ;
            assign v_float_pld[i].reg_rs2_val               = v_issue_pld[i].reg_rs2_val         ;
            assign v_float_pld[i].reg_rs3_val               = v_issue_pld[i].reg_rs3_val         ;
            assign v_float_pld[i].inst_imm                  = v_issue_pld[i].inst_imm            ;
            assign v_float_pld[i].rs1_forward_id            = v_issue_pld[i].rs1_forward_id      ;
            assign v_float_pld[i].rs2_forward_id            = v_issue_pld[i].rs2_forward_id      ;
            assign v_float_pld[i].rs3_forward_id            = v_issue_pld[i].rs3_forward_id      ;
            assign v_float_pld[i].rs1_forward_cycle         = v_issue_pld[i].rs1_forward_cycle   ;
            assign v_float_pld[i].rs2_forward_cycle         = v_issue_pld[i].rs2_forward_cycle   ;
            assign v_float_pld[i].rs3_forward_cycle         = v_issue_pld[i].rs3_forward_cycle   ;
            assign v_float_pld[i].lsu_id                    = v_issue_pld[i].lsu_id              ;
            assign v_float_pld[i].fe_bypass_pld             = v_issue_pld[i].fe_bypass_pld       ;

            assign v_csr_pld[i].inst_pld                  = v_issue_pld[i].inst_pld            ;
            assign v_csr_pld[i].inst_id                   = v_issue_pld[i].inst_id             ;
            assign v_csr_pld[i].inst_rd                   = v_issue_pld[i].phy_rd              ;
            assign v_csr_pld[i].inst_rd_en                = v_issue_pld[i].inst_rd_en          ;
            assign v_csr_pld[i].c_ext                     = v_issue_pld[i].c_ext               ;
            assign v_csr_pld[i].inst_fp_rd_en             = v_issue_pld[i].inst_fp_rd_en       ;
            assign v_csr_pld[i].arch_reg_index            = v_issue_pld[i].arch_rd             ;
            assign v_csr_pld[i].inst_pc                   = v_issue_pld[i].inst_pc             ;
            assign v_csr_pld[i].reg_rs1_val               = v_issue_pld[i].reg_rs1_val         ;
            assign v_csr_pld[i].reg_rs2_val               = v_issue_pld[i].reg_rs2_val         ;
            assign v_csr_pld[i].reg_rs3_val               = v_issue_pld[i].reg_rs3_val         ;
            assign v_csr_pld[i].inst_imm                  = v_issue_pld[i].inst_imm            ;
            assign v_csr_pld[i].rs1_forward_id            = v_issue_pld[i].rs1_forward_id      ;
            assign v_csr_pld[i].rs2_forward_id            = v_issue_pld[i].rs2_forward_id      ;
            assign v_csr_pld[i].rs3_forward_id            = v_issue_pld[i].rs3_forward_id      ;
            assign v_csr_pld[i].rs1_forward_cycle         = v_issue_pld[i].rs1_forward_cycle   ;
            assign v_csr_pld[i].rs2_forward_cycle         = v_issue_pld[i].rs2_forward_cycle   ;
            assign v_csr_pld[i].rs3_forward_cycle         = v_issue_pld[i].rs3_forward_cycle   ;
            assign v_csr_pld[i].lsu_id                    = v_issue_pld[i].lsu_id              ;
            assign v_csr_pld[i].fe_bypass_pld             = v_issue_pld[i].fe_bypass_pld       ;

            assign v_custom_pld[i].inst_pld                  = v_issue_pld[i].inst_pld            ;
            assign v_custom_pld[i].inst_id                   = v_issue_pld[i].inst_id             ;
            assign v_custom_pld[i].inst_rd                   = v_issue_pld[i].phy_rd              ;
            assign v_custom_pld[i].inst_rd_en                = v_issue_pld[i].inst_rd_en          ;
            assign v_custom_pld[i].c_ext                     = v_issue_pld[i].c_ext               ;
            assign v_custom_pld[i].inst_fp_rd_en             = v_issue_pld[i].inst_fp_rd_en       ;
            assign v_custom_pld[i].arch_reg_index            = v_issue_pld[i].arch_rd             ;
            assign v_custom_pld[i].inst_pc                   = v_issue_pld[i].inst_pc             ;
            assign v_custom_pld[i].reg_rs1_val               = v_issue_pld[i].reg_rs1_val         ;
            assign v_custom_pld[i].reg_rs2_val               = v_issue_pld[i].reg_rs2_val         ;
            assign v_custom_pld[i].reg_rs3_val               = v_issue_pld[i].reg_rs3_val         ;
            assign v_custom_pld[i].inst_imm                  = v_issue_pld[i].inst_imm            ;
            assign v_custom_pld[i].rs1_forward_id            = v_issue_pld[i].rs1_forward_id      ;
            assign v_custom_pld[i].rs2_forward_id            = v_issue_pld[i].rs2_forward_id      ;
            assign v_custom_pld[i].rs3_forward_id            = v_issue_pld[i].rs3_forward_id      ;
            assign v_custom_pld[i].rs1_forward_cycle         = v_issue_pld[i].rs1_forward_cycle   ;
            assign v_custom_pld[i].rs2_forward_cycle         = v_issue_pld[i].rs2_forward_cycle   ;
            assign v_custom_pld[i].rs3_forward_cycle         = v_issue_pld[i].rs3_forward_cycle   ;
            assign v_custom_pld[i].lsu_id                    = v_issue_pld[i].lsu_id              ;
            assign v_custom_pld[i].fe_bypass_pld             = v_issue_pld[i].fe_bypass_pld       ;

            assign onehot_mext[i]       = v_issue_pld[i].goto_mext && v_issue_en[i];
            assign onehot_csr[i]        = v_issue_pld[i].goto_csr && v_issue_en[i];
            assign onehot_custom[i]     = v_issue_pld[i].goto_custom && v_issue_en[i];
            assign onehot_float[i]      = v_issue_pld[i].goto_float && v_issue_en[i];

            assign v_mext_pld_arb[i]    = v_mext_pld[i] & {$bits(eu_pkg){onehot_mext[i]}};
            assign v_csr_pld_arb[i]     = v_csr_pld[i] & {$bits(eu_pkg){onehot_csr[i]}};
            assign v_custom_pld_arb[i]  = v_custom_pld[i] & {$bits(eu_pkg){onehot_custom[i]}};
            assign v_float_pld_arb[i]   = v_float_pld[i] & {$bits(eu_pkg){onehot_float[i]}};

        end
    endgenerate


endmodule

