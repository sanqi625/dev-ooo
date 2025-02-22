

module toy_dispatch 
    import toy_pack::*;
(
    input  logic                                clk                                 ,
    input  logic                                rst_n                               ,

    input  logic [OOO_DEPTH-1           :0]     v_issue_en                          ,
    input  issue_pkg                            v_issue_pld             [OOO_DEPTH-1        :0]     ,
   
    // LSU =========================================================================
    output logic [3                     :0]     v_lsu_instruction_vld       ,
    output eu_pkg                               v_lsu_pld       [3:0]       ,
    output logic [3                     :0]     v_lsu_stu_en                ,

    // ALU =========================================================================
    output logic [INST_ALU_NUM-1        :0]     v_alu_instruction_vld                               ,
    output eu_pkg                               v_alu_instruction_pld   [INST_ALU_NUM-1    :0]      ,

    // MEXT =========================================================================
    output logic                                mext_instruction_vld        ,
    output eu_pkg                               mext_instruction_pld        ,

    // FLOAT ========================================================================
    output logic                                float_instruction_vld        ,
    output eu_pkg                               float_instruction_pld        ,

    // Custom 0 ====================================================================
    output logic                                custom_instruction_vld      ,
    output eu_pkg                               custom_instruction_pld      ,


    // CSR =========================================================================
    output logic                                csr_instruction_vld         ,
    output eu_pkg                               csr_instruction_pld          
);

    //##############################################
    // decode -8 -buffer -4
    //##############################################


    generate
        for (genvar i=0;i<OOO_DEPTH;i=i+1)begin:DECODE_GEN

            assign v_alu_instruction_vld[i]                     = v_issue_pld[i].goto_alu && v_issue_en[i] ;
            assign v_alu_instruction_pld[i].inst_pld            = v_issue_pld[i].inst_pld            ;
            assign v_alu_instruction_pld[i].inst_id             = v_issue_pld[i].inst_id             ;
            assign v_alu_instruction_pld[i].inst_rd             = v_issue_pld[i].phy_rd              ;
            assign v_alu_instruction_pld[i].inst_rd_en          = v_issue_pld[i].inst_rd_en          ;
            assign v_alu_instruction_pld[i].c_ext               = v_issue_pld[i].c_ext               ;
            assign v_alu_instruction_pld[i].inst_fp_rd_en       = v_issue_pld[i].inst_fp_rd_en       ;
            assign v_alu_instruction_pld[i].arch_reg_index      = v_issue_pld[i].arch_rd             ;
            assign v_alu_instruction_pld[i].inst_pc             = v_issue_pld[i].inst_pc             ;
            assign v_alu_instruction_pld[i].reg_rs1_val         = v_issue_pld[i].reg_rs1_val         ;
            assign v_alu_instruction_pld[i].reg_rs2_val         = v_issue_pld[i].reg_rs2_val         ;
            assign v_alu_instruction_pld[i].reg_rs3_val         = v_issue_pld[i].reg_rs3_val         ;
            assign v_alu_instruction_pld[i].inst_imm            = v_issue_pld[i].inst_imm            ;
            assign v_alu_instruction_pld[i].lsu_id              = v_issue_pld[i].lsu_id              ;
            assign v_alu_instruction_pld[i].eu_bp_pld           = v_issue_pld[i].eu_bp_pld           ;
            assign v_alu_instruction_pld[i].fwd_pld             = v_issue_pld[i].fwd_pld             ;

            assign v_lsu_instruction_vld[i]                     = v_issue_pld[i].goto_lsu && v_issue_en[i] ;
            assign v_lsu_pld[i].inst_pld                        = v_issue_pld[i].inst_pld            ;
            assign v_lsu_stu_en[i]                              = v_issue_pld[i].goto_stu            ;
            assign v_lsu_pld[i].inst_id                         = v_issue_pld[i].inst_id             ;
            assign v_lsu_pld[i].inst_rd                         = v_issue_pld[i].phy_rd              ;
            assign v_lsu_pld[i].inst_rd_en                      = v_issue_pld[i].inst_rd_en          ;
            assign v_lsu_pld[i].c_ext                           = v_issue_pld[i].c_ext               ;
            assign v_lsu_pld[i].inst_fp_rd_en                   = v_issue_pld[i].inst_fp_rd_en       ;
            assign v_lsu_pld[i].arch_reg_index                  = v_issue_pld[i].arch_rd             ;
            assign v_lsu_pld[i].inst_pc                         = v_issue_pld[i].inst_pc             ;
            assign v_lsu_pld[i].reg_rs1_val                     = v_issue_pld[i].reg_rs1_val         ;
            assign v_lsu_pld[i].reg_rs2_val                     = v_issue_pld[i].reg_rs2_val         ;
            assign v_lsu_pld[i].reg_rs3_val                     = v_issue_pld[i].reg_rs3_val         ;
            assign v_lsu_pld[i].inst_imm                        = v_issue_pld[i].inst_imm            ;
            assign v_lsu_pld[i].eu_bp_pld                       = v_issue_pld[i].eu_bp_pld           ;
            assign v_lsu_pld[i].lsu_id                          = v_issue_pld[i].lsu_id              ;                 ;
            assign v_lsu_pld[i].fwd_pld                         = v_issue_pld[i].fwd_pld             ;
        end
    endgenerate

   
    //##############################################
    // crossbar 
    //##############################################
    toy_dispatch_crossbar u_toy_dispatch_crossbar
    (
        .clk                   (clk                    ),
        .rst_n                 (rst_n                  ),
        .v_issue_en            (v_issue_en             ),
        .v_issue_pld           (v_issue_pld            ),

        .mext_instruction_vld  (mext_instruction_vld   ),
        .mext_pld              (mext_instruction_pld   ),
        .float_instruction_vld (float_instruction_vld  ),
        .float_pld             (float_instruction_pld  ),
        .csr_instruction_vld   (csr_instruction_vld    ),
        .csr_pld               (csr_instruction_pld    ),
        .custom_instruction_vld(custom_instruction_vld ),
        .custom_pld            (custom_instruction_pld ));


    // DEBUG =========================================================================================================

    // `ifdef TOY_SIM


    // initial begin
    //     if($test$plusargs("DEBUG")) begin
    //         forever begin
    //             @(posedge clk)

    //             $display("===");
    //             $display("register_lock         = %b" , register_lock);
    //             $display("register_lock_release = %b" , register_lock_release);
    //             // for (int x =0 ;x<4;x=x+1)begin
    //             //     if(v_fetched_instruction_vld[x] && v_fetched_instruction_rdy[x]) begin
    //             //         $display("[dispatch] receive instruction %h, decode goto_alu=%0d, goto_lsu=%0d." , v_fetched_instruction_pld[x],v_goto_alu[x],v_goto_lsu[x]);
    //             //     end

    //             //     if(v_alu_instruction_vld[x] && v_alu_instruction_rdy[x]) begin
    //             //         $display("[dispatch] issue instruction %h to alu." , v_alu_instruction_pld[x]);
    //             //         $display("[dispatch] rs1=%0d, rs2=%0d." , v_dec_inst_rs1[x], v_dec_inst_rs2[x]);
    //             //         $display("[dispatch] rs1_val=0x%h, rs2_val=0x%h." , v_alu_rs1_val[x], v_alu_rs2_val[x]);
    //             //     end
    //             // end
    //             // if(|(v_lsu_instruction_vld & v_lsu_instruction_rdy)) begin
    //             //     $display("[dispatch] issue instruction %h to lsu." , lsu_instruction_pld);
    //             // end
                


    //             // if (reg_wr_en) begin
    //             //     $display("[dispatch] wb reg[%0d] = %h" , reg_index,reg_val);
    //             // end

    //         end
    //     end
    // end

    // logic [31:0] reg_stall;
    // always_ff @(posedge clk or negedge rst_n) begin
    //     if(~rst_n) reg_stall <= 32'b0;
    //     else if(~|v_fetched_instruction_rdy) reg_stall <= reg_stall + 1;
    // end


    // logic [REG_WIDTH-1:0] registers_shadow            [0:31]  ;
    // logic [REG_WIDTH-1:0] fp_registers_shadow         [0:31]  ;
    // logic [4:0] int_rename_id         [0:31]  ;
    // logic [4:0] fp_rename_id          [0:31]  ;

    // logic [31:0] int_phy_data         [95:0]  ;
    // logic [31:0] fp_phy_data          [95:0]  ;


    // logic [INST_WIDTH-1:0] fetched_instruction_pld_lut  [0:(1<<INST_IDX_WIDTH)-1];
    // logic [ADDR_WIDTH-1:0] fetched_instruction_pc_lut   [0:(1<<INST_IDX_WIDTH)-1];

    // function string print_all_reg_shadow();
    //     string res;
    //     $sformat(res, "zo:%h ra:%h sp:%h gp:%h tp:%h t0:%h t1:%h t2:%h s0:%h s1:%h a0:%h a1:%h a2:%h a3:%h a4:%h a5:%h a6:%h a7:%h s2:%h s3:%h s4:%h s5:%h s6:%h s7:%h s8:%h s9:%h s10:%h s11:%h t3:%h t4:%h t5:%h t6:%h \n fp0:%h fp1:%h fp2:%h fp3:%h fp4:%h fp5:%h fp6:%h fp7:%h fp8:%h fp9:%h fp10:%h fp11:%h fp12:%h fp13:%h fp14:%h fp15:%h fp16:%h fp17:%h fp18:%h fp19:%h fp20:%h fp21:%h fp22:%h fp23:%h fp24:%h fp25:%h fp26:%h fp27:%h fp28:%h fp29:%h fp30:%h fp31:%h", 
    //         registers_shadow[0]  ,
    //         registers_shadow[1]  ,
    //         registers_shadow[2]  ,
    //         registers_shadow[3]  ,
    //         registers_shadow[4]  ,
    //         registers_shadow[5]  ,
    //         registers_shadow[6]  ,
    //         registers_shadow[7]  ,
        
    //         registers_shadow[8]  ,
    //         registers_shadow[9]  ,
    //         registers_shadow[10] ,
    //         registers_shadow[11] ,
    //         registers_shadow[12] ,
    //         registers_shadow[13] ,
    //         registers_shadow[14] ,
    //         registers_shadow[15] ,
        
    //         registers_shadow[16] ,
    //         registers_shadow[17] ,
    //         registers_shadow[18] ,
    //         registers_shadow[19] ,
    //         registers_shadow[20] ,
    //         registers_shadow[21] ,
    //         registers_shadow[22] ,
    //         registers_shadow[23] ,

    //         registers_shadow[24] ,
    //         registers_shadow[25] ,
    //         registers_shadow[26] ,
    //         registers_shadow[27] ,
    //         registers_shadow[28] ,
    //         registers_shadow[29] ,
    //         registers_shadow[30] ,
    //         registers_shadow[31] ,

    //         fp_registers_shadow[0]  ,
    //         fp_registers_shadow[1]  ,
    //         fp_registers_shadow[2]  ,
    //         fp_registers_shadow[3]  ,
    //         fp_registers_shadow[4]  ,
    //         fp_registers_shadow[5]  ,
    //         fp_registers_shadow[6]  ,
    //         fp_registers_shadow[7]  ,
        
    //         fp_registers_shadow[8]  ,
    //         fp_registers_shadow[9]  ,
    //         fp_registers_shadow[10] ,
    //         fp_registers_shadow[11] ,
    //         fp_registers_shadow[12] ,
    //         fp_registers_shadow[13] ,
    //         fp_registers_shadow[14] ,
    //         fp_registers_shadow[15] ,
        
    //         fp_registers_shadow[16] ,
    //         fp_registers_shadow[17] ,
    //         fp_registers_shadow[18] ,
    //         fp_registers_shadow[19] ,
    //         fp_registers_shadow[20] ,
    //         fp_registers_shadow[21] ,
    //         fp_registers_shadow[22] ,
    //         fp_registers_shadow[23] ,

    //         fp_registers_shadow[24] ,
    //         fp_registers_shadow[25] ,
    //         fp_registers_shadow[26] ,
    //         fp_registers_shadow[27] ,
    //         fp_registers_shadow[28] ,
    //         fp_registers_shadow[29] ,
    //         fp_registers_shadow[30] ,
    //         fp_registers_shadow[31]             
    //         );
    //     return res;
    // endfunction

    // initial begin
    //     int file_handle;
    //     for(int i=0;i<32;i=i+1) begin
    //         registers_shadow[i] = 0;
    //     end

    //     file_handle = $fopen("sim_trace.log", "w");
    //     forever begin
    //         @(posedge clk)

    //         // update reorder buffer ===========================================================
    //         if(v_fetched_instruction_vld[0] && v_fetched_instruction_rdy[0]) begin
    //             fetched_instruction_pld_lut[v_fetched_instruction_idx[0]] = v_fetched_instruction_pld[0];
    //             fetched_instruction_pc_lut[v_fetched_instruction_idx[0]]  = v_fetched_instruction_pc[0];
    //         end 

    //         // update shadowreg file ===========================================================
    //         for(int j=0;j<96;j=j+1) begin
    //             int_phy_data[j] = u_toy_scalar.u_core.u_dispatch.u_int_regfile.u_toy_physicial_regfile.v_reg_phy_data[j];
    //             fp_phy_data[j] = u_toy_scalar.u_core.u_dispatch.u_fp_regfile.u_toy_physicial_regfile.v_reg_phy_data[j];
    //         end
    //         for(int i=0;i<32;i=i+1) begin
    //             int_rename_id[i] = u_toy_scalar.u_core.u_dispatch.u_int_regfile.u_rename_reg_file.v_reg_phy_id[i];
    //             fp_rename_id[i] = u_toy_scalar.u_core.u_dispatch.u_fp_regfile.u_rename_reg_file.v_reg_phy_id[i];
    //             registers_shadow[i] = int_phy_data[int_rename_id[i]];
    //             fp_registers_shadow[i] = fp_phy_data[fp_rename_id[i]];
    //         end


    //         // if(lsu_inst_commit_en_rd) begin
    //         //     $fdisplay(file_handle, "[pc=%h][%s]", fetched_instruction_pc_lut[lsu_reg_inst_idx_rd] ,  print_all_reg_shadow());
    //         //     if(lsu_reg_wr_en)
    //         //         registers_shadow[lsu_reg_index] = lsu_reg_val;
    //         // end

    //         if(v_alu_inst_commit_en[0]) begin
    //             $fdisplay(file_handle, "[pc=%h][%s]", fetched_instruction_pc_lut[v_alu_reg_inst_idx[0]]    ,  print_all_reg_shadow());
    //         end
            
    //         if(mext_inst_commit_en) begin
    //             $fdisplay(file_handle, "[pc=%h][%s]", fetched_instruction_pc_lut[mext_reg_inst_idx]   ,  print_all_reg_shadow());
    //         end
            
    //         if(csr_inst_commit_en) begin
    //             $fdisplay(file_handle, "[pc=%h][%s]", fetched_instruction_pc_lut[csr_reg_inst_idx]    ,  print_all_reg_shadow());        
    //         end
            
    //         // if(lsu_inst_commit_en_wr)begin
    //         //     $fdisplay(file_handle, "[pc=%h][%s]", fetched_instruction_pc_lut[lsu_reg_inst_idx_wr] ,  print_all_reg_shadow());
    //         // end
    //     end
    // end

    // logic [31:0] fetch_entry_cnt [3:0];
    // generate
    //     for(genvar a=0;a<4;a=a+1)begin
    //         always_ff @(posedge clk or negedge rst_n) begin:FETCH_ENTRY_CNT_FOR_SIM
    //             if(~rst_n)begin
    //                 fetch_entry_cnt[a] <= 32'b0;
    //             end
    //             else if(v_fetched_instruction_vld[a] && v_fetched_instruction_rdy[a])begin
    //                 fetch_entry_cnt[a] <= fetch_entry_cnt[a] + 1'b1;
    //             end
    //         end
    //     end
    // endgenerate

    // logic [31:0] fetch_0_cnt;
    // always_ff @(posedge clk or negedge rst_n) begin
    //     if(~rst_n)begin
    //         fetch_0_cnt <= 32'b0;
    //     end
    //     else if(~|(v_fetched_instruction_vld & v_fetched_instruction_rdy))begin
    //         fetch_0_cnt <= fetch_0_cnt + 1'b1;
    //     end
        
    // end

    // // logic dispatch_req_handshake;
    // // assign dispatch_req_handshake = v_fetched_instruction_vld && v_fetched_instruction_rdy;
    
    // // initial begin
    // //   forever begin
    // //       @(posedge clk)
    // //       if(dispatch_req_handshake)begin
    // //          $display("Dispatch req handshake success!!!");
    // //          $display("Dispatch fetch pc is [%h], inst is [%h]",v_fetched_instruction_pc[0],v_fetched_instruction_pld[0]);
    // //       end
    // //   end
    // // end

    // `endif


endmodule
