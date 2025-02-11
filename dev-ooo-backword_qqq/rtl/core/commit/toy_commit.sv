module toy_commit 
    import toy_pack::*;
    (
    input   logic                               clk                                         ,
    input   logic                               rst_n                                       ,

    input   logic [INST_ALU_NUM-1        :0]    v_alu_commit_en                             ,
    input   logic [INST_IDX_WIDTH-1      :0]    v_alu_commit_id         [INST_ALU_NUM-1 :0] ,
    input   commit_bp_branch_pkg                v_alu_commit_pld        [INST_ALU_NUM-1 :0] ,

    output  logic [3                     :0]    v_st_ack_commit_en                          ,
    output  logic [$clog2(STU_DEPTH)-1   :0]    v_st_ack_commit_entry   [3              :0] ,

    input   logic                               stq_commit_en                               ,
    input   logic [INST_IDX_WIDTH-1      :0]    stq_commit_id                               ,
    input   stq_commit_pkg                      stq_commit_pld                              ,

    input   logic [1                     :0]    v_ld_commit_en                              ,
    input   logic [INST_IDX_WIDTH-1      :0]    v_ld_commit_id          [1              :0] ,

    input   logic                               fp_commit_en                                ,
    input   logic [INST_IDX_WIDTH-1      :0]    fp_commit_id                                ,
    input   fp_commit_pkg                       fp_commit_pld                               ,

    input   logic                               mext_commit_en                              ,
    input   logic [INST_IDX_WIDTH-1      :0]    mext_commit_id                              ,

    input   logic                               csr_commit_en                               ,
    input   logic [INST_IDX_WIDTH-1      :0]    csr_commit_id                               ,
    input   csr_commit_pkg                      csr_commit_pld                              ,
 
    input   logic [INST_DECODE_NUM-1     :0]    v_rename_en                                 ,
    input   decode_commit_bp_pkg                v_commit_rename_pld [INST_DECODE_NUM-1:0]   ,

    output  logic                               cancel_en                                   ,
    output  logic                               cancel_edge_en                              ,
    output  logic                               cancel_edge_en_d                            ,

    output  logic  [7                    :0]    FCSR_backup                                 ,
    output  logic  [COMMIT_REL_CHANNEL-1 :0]    v_rf_commit_en                              ,
    output  commit_pkg                          v_rf_commit_pld     [COMMIT_REL_CHANNEL-1:0],
    
    output  logic  [COMMIT_REL_CHANNEL-1 :0]    v_commit_error_en                           ,
    output  be_pkg                              v_bp_commit_pld     [COMMIT_REL_CHANNEL-1:0],

    output  logic  [63                   :0]    csr_INSTRET                                 ,

    output  logic                               commit_credit_rel_en                        ,
    output  logic  [2                    :0]    commit_credit_rel_num                       ,
    //===========================
    // need to review !!!!
    //===========================
    input   logic  [INST_READ_CHANNEL-1 :0]     v_instruction_vld                           ,
    input   logic  [INST_READ_CHANNEL-1 :0]     v_instruction_rdy                           ,
    input   logic  [ADDR_WIDTH-1        :0]     v_instruction_pc  [INST_READ_CHANNEL-1:0]   ,
    input   logic  [INST_IDX_WIDTH-1    :0]     v_instruction_idx [INST_READ_CHANNEL-1:0]   ,
    input   fe_bypass_pkg                       v_inst_fe_pld     [INST_READ_CHANNEL-1:0] 
    
);
    //=================================================
    // logic 
    //=================================================
    localparam integer unsigned DEPTH_WIDTH     = $clog2(COMMIT_QUEUE_DEPTH)                ;
    localparam integer unsigned CANCEL_CNT_NUM  = 2                                         ;

    logic                                   rd_ptr_over                                     ;
    logic   [3                      :0]     cancel_cnt                                      ;
    logic   [6                      :0]     v_s_commit_en                                   ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_commit_queue_en                               ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_stq_en                                        ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     vv_ld_en             [1                     :0] ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_commit_queue_update_en                        ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_nxt_pc_en                                     ;
    logic   [COMMIT_REL_CHANNEL-1   :0]     v_correct_en                                    ;
    logic   [COMMIT_REL_CHANNEL-1   :0]     v_cancel_edge_en                                ;
    logic   [COMMIT_REL_CHANNEL-1   :0]     v_commit_en_series                              ;
    logic   [INST_READ_CHANNEL-1    :0]     v_s_pc_en                                       ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_pc_queue_en                                   ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_pc_queue_update_en;

    logic   [DEPTH_WIDTH-1          :0]     rd_ptr                                          ;
    logic   [DEPTH_WIDTH-1          :0]     rd_ptr_nxt                                      ;
    logic   [DEPTH_WIDTH-1          :0]     rd_ptr_add                                      ;
    logic   [ADDR_WIDTH-1           :0]     commit_pc_store                                 ;

    logic   [6                      :0]     vv_commit_en        [COMMIT_QUEUE_DEPTH-1   :0] ;
    logic   [ADDR_WIDTH-1           :0]     v_nxt_pc            [COMMIT_QUEUE_DEPTH-1   :0] ;
    // logic   [ADDR_WIDTH-1           :0]     v_s_pc_pld          [INST_READ_CHANNEL-1    :0] ;
    logic   [ADDR_WIDTH-1           :0]     v_pc_queue_mem      [COMMIT_QUEUE_DEPTH-1   :0] ;
    logic   [INST_READ_CHANNEL-1    :0]     vv_pc_en            [COMMIT_QUEUE_DEPTH-1:0];

    fe_bypass_pkg                           v_be_queue_update_pld[COMMIT_QUEUE_DEPTH-1:0];
    commit_pkg                              v_commit_queue_mem  [COMMIT_QUEUE_DEPTH-1   :0] ;                
    commit_pkg                              v_s_commit_pld      [6                      :0] ;
    commit_pkg                              v_commit_queue_pld  [COMMIT_QUEUE_DEPTH-1   :0] ;
    commit_pkg                              v_commit_queue_update_pld  [COMMIT_QUEUE_DEPTH-1   :0] ;
    fe_bypass_pkg                           v_be_pld            [COMMIT_QUEUE_DEPTH-1:0];
    
    logic    [ADDR_WIDTH-1:          0]     v_full_offset       [COMMIT_REL_CHANNEL-1:0]; 

    //=================================================
    // flatten 12 to 128 cross bar
    //================================================= 

    logic   [INST_DECODE_NUM-1      :0]     vv_rename_commit_en              [COMMIT_QUEUE_DEPTH-1 :0] ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_rename_commit_queue_update_en                            ;   
    logic   [INST_ALU_NUM-1         :0]     vv_alu_commit_en                 [COMMIT_QUEUE_DEPTH-1 :0] ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_alu_commit_queue_update_en                               ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     vv_fp_commit_en                                            ;  
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     vv_csr_commit_en                                           ; 
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     vv_mext_commit_en                                          ;   
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_rename_commit_en                                         ;
    logic   [COMMIT_QUEUE_DEPTH-1   :0]     v_alu_final_commit_en                                      ;

    generate 
        for (genvar i = 0;i<COMMIT_QUEUE_DEPTH ;i=i+1 ) begin
            for (genvar j = 0;j<INST_DECODE_NUM ;j=j+1 ) begin
                assign vv_rename_commit_en[i][j] = (i == v_commit_rename_pld[j].inst_id) & v_rename_en[j];
            end
            for (genvar k = 0;k<INST_ALU_NUM ;k=k+1 ) begin
                assign vv_alu_commit_en[i][k]    = (i == v_alu_commit_id[k]) & v_alu_commit_en[k];
            end
            assign vv_fp_commit_en[i]            = (i == fp_commit_id) & fp_commit_en;
            assign vv_csr_commit_en[i]           = (i == csr_commit_id) & csr_commit_en; 
            assign vv_mext_commit_en[i]          = (i == mext_commit_id) & mext_commit_en;
            assign v_stq_en[i]                   = stq_commit_en && (stq_commit_id == i);
            assign vv_ld_en[0][i]                = v_ld_commit_en[0] && (v_ld_commit_id[0] == i);
            assign vv_ld_en[1][i]                = v_ld_commit_en[1] && (v_ld_commit_id[1] == i);
            // rename update signal
            assign v_rename_commit_en[i]         = |vv_rename_commit_en[i];
            // alu update signal
            assign v_alu_final_commit_en[i]      = |vv_alu_commit_en[i];
            // commit enable signal 
            assign v_commit_queue_update_en[i]   = v_alu_final_commit_en[i] | vv_fp_commit_en[i] | vv_csr_commit_en[i] | v_stq_en[i] | vv_ld_en[0][i] | vv_ld_en[1][i] | vv_mext_commit_en[i];
        end

        for (genvar k = 0;k<COMMIT_QUEUE_DEPTH ;k=k+1 ) begin
            // commit inst id from rename module 
            assign v_commit_queue_update_pld[k].inst_id = ({INST_IDX_WIDTH{vv_rename_commit_en[k][0]}} & v_commit_rename_pld[0].inst_id) |
                        ({INST_IDX_WIDTH{vv_rename_commit_en[k][1]}} & v_commit_rename_pld[1].inst_id) |
                        ({INST_IDX_WIDTH{vv_rename_commit_en[k][2]}} & v_commit_rename_pld[2].inst_id) |
                        ({INST_IDX_WIDTH{vv_rename_commit_en[k][3]}} & v_commit_rename_pld[3].inst_id) ;

            // commit common pld from rename module 
            assign v_commit_queue_update_pld[k].commit_common_pld = ({$bits(commit_common_pkg){vv_rename_commit_en[k][0]}} & v_commit_rename_pld[0].commit_common_pld) |
                        ({$bits(commit_common_pkg){vv_rename_commit_en[k][1]}} & v_commit_rename_pld[1].commit_common_pld) |
                        ({$bits(commit_common_pkg){vv_rename_commit_en[k][2]}} & v_commit_rename_pld[2].commit_common_pld) |
                        ({$bits(commit_common_pkg){vv_rename_commit_en[k][3]}} & v_commit_rename_pld[3].commit_common_pld) ;

            // commit bp branch pld from rename, alu and csr module 
            assign v_commit_queue_update_pld[k].commit_bp_branch_pld = ({$bits(commit_bp_branch_pkg){vv_rename_commit_en[k][0]}} & v_commit_rename_pld[0].commit_bp_branch_pld) |
                        ({$bits(commit_bp_branch_pkg){vv_rename_commit_en[k][1]}} & v_commit_rename_pld[1].commit_bp_branch_pld) |
                        ({$bits(commit_bp_branch_pkg){vv_rename_commit_en[k][2]}} & v_commit_rename_pld[2].commit_bp_branch_pld) |
                        ({$bits(commit_bp_branch_pkg){vv_rename_commit_en[k][3]}} & v_commit_rename_pld[3].commit_bp_branch_pld) |
                        ({$bits(commit_bp_branch_pkg){vv_alu_commit_en[k][0]}} & v_alu_commit_pld[0]) |
                        ({$bits(commit_bp_branch_pkg){vv_alu_commit_en[k][1]}} & v_alu_commit_pld[1]) |
                        ({$bits(commit_bp_branch_pkg){vv_alu_commit_en[k][2]}} & v_alu_commit_pld[2]) |
                        ({$bits(commit_bp_branch_pkg){vv_alu_commit_en[k][3]}} & v_alu_commit_pld[3]) |
                        ({$bits(commit_bp_branch_pkg){vv_csr_commit_en[k]}} & csr_commit_pld.commit_bp_branch_pld);

            // commit stq_commit entry en from rename module 
            assign v_commit_queue_update_pld[k].stq_commit_entry_en = (vv_rename_commit_en[k][0] & v_commit_rename_pld[0].store_commit_en) |
                        (vv_rename_commit_en[k][1] & v_commit_rename_pld[1].store_commit_en) |
                        (vv_rename_commit_en[k][2] & v_commit_rename_pld[2].store_commit_en) |
                        (vv_rename_commit_en[k][3] & v_commit_rename_pld[3].store_commit_en) ;

            // commit FCSR en from rename, csr and fp module 
            assign v_commit_queue_update_pld[k].FCSR_en = ({8{vv_rename_commit_en[k][0]}} & {8{v_commit_rename_pld[0].fp_commit_en}}) |
                        ({8{vv_rename_commit_en[k][1]}} & {8{v_commit_rename_pld[1].fp_commit_en}}) |
                        ({8{vv_rename_commit_en[k][2]}} & {8{v_commit_rename_pld[2].fp_commit_en}}) |
                        ({8{vv_rename_commit_en[k][3]}} & {8{v_commit_rename_pld[3].fp_commit_en}}) |
                        ({8{vv_csr_commit_en[k]}} & csr_commit_pld.FCSR_en) |
                        ({8{vv_fp_commit_en[k]}} & fp_commit_pld.FCSR_en);

            // commit FCSR_data from csr and fp module 
            assign v_commit_queue_update_pld[k].FCSR_data = ({8{vv_csr_commit_en[k]}} & csr_commit_pld.FCSR_data)|
                        ({8{vv_fp_commit_en[k]}} & fp_commit_pld.FCSR_data);

        end
    endgenerate
    
    //=================================================
    // commit mem  
    //=================================================
    generate
        for(genvar i=0;i<COMMIT_QUEUE_DEPTH;i=i+1)begin
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_commit_queue_mem[i] <= {$bits(commit_pkg){1'b0}};
                end
                // update result from rename module
                else if(v_rename_commit_en[i]) begin 
                    v_commit_queue_mem[i].inst_id <= v_commit_queue_update_pld[i].inst_id;
                    v_commit_queue_mem[i].commit_common_pld <= v_commit_queue_update_pld[i].commit_common_pld;
                    v_commit_queue_mem[i].commit_bp_branch_pld <= v_commit_queue_update_pld[i].commit_bp_branch_pld;
                    v_commit_queue_mem[i].stq_commit_entry_en <= v_commit_queue_update_pld[i].stq_commit_entry_en;
                    v_commit_queue_mem[i].FCSR_en <= v_commit_queue_update_pld[i].FCSR_en;
                end 
                // update result from alu module
                else if(v_alu_final_commit_en[i]) begin 
                    v_commit_queue_mem[i].commit_bp_branch_pld <= v_commit_queue_update_pld[i].commit_bp_branch_pld;
                end 
                // update result from csr module
                else if(vv_csr_commit_en[i]) begin 
                    v_commit_queue_mem[i].commit_bp_branch_pld <= v_commit_queue_update_pld[i].commit_bp_branch_pld;
                    v_commit_queue_mem[i].FCSR_en <= v_commit_queue_update_pld[i].FCSR_en;
                    v_commit_queue_mem[i].FCSR_data <= v_commit_queue_update_pld[i].FCSR_data;
                end
                // update resule from csr module
                else if(vv_fp_commit_en[i]) begin 
                    v_commit_queue_mem[i].FCSR_en <= v_commit_queue_update_pld[i].FCSR_en;
                    v_commit_queue_mem[i].FCSR_data <= v_commit_queue_update_pld[i].FCSR_data;
                end
                // update result from stq module
                else if(v_stq_en[i])begin
                    v_commit_queue_mem[i].stq_commit_entry <= stq_commit_pld.stq_commit_entry;
                end
            end
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_commit_queue_en[i] <= 1'b0;
                end
                else if(cancel_en) begin
                    v_commit_queue_en[i] <= 1'b0;
                end
                else if(v_commit_queue_update_en[i]) begin
                    v_commit_queue_en[i] <= 1'b1;
                end
                else if( |v_rf_commit_en && ((i>=rd_ptr) && (i<rd_ptr_nxt)) ||  (rd_ptr_over && ((i>=rd_ptr) || (i+COMMIT_QUEUE_DEPTH)<{rd_ptr_over,rd_ptr_nxt})) )  begin
                    v_commit_queue_en[i] <= 1'b0;
                end 
            end

            // always_ff @(posedge clk or negedge rst_n) begin
            //     if(~rst_n)begin
            //         v_pc_queue_mem[i] <= {(ADDR_WIDTH){1'b0}};
            //     end
            //     else if(v_pc_queue_update_en[i]==1'b1)begin
            //         v_pc_queue_mem[i] <= v_pc_queue_update_pld[i];
            //     end
            // end

            // always_ff @(posedge clk or negedge rst_n) begin
            //     if(~rst_n)begin
            //         v_be_pld[i] <= {$bits(fe_bypass_pkg){1'b0}};
            //     end
            //     else if(v_pc_queue_update_en[i]==1'b1)begin
            //         v_be_pld[i] <= v_be_queue_update_pld[i];
            //     end
            // end

            // always_ff @(posedge clk or negedge rst_n) begin
            //     if(~rst_n)begin
            //         v_pc_queue_en[i] <= 1'b0;
            //     end
            //     else if(cancel_en) begin
            //         v_pc_queue_en[i] <= 1'b0;
            //     end
            //     else if(v_pc_queue_update_en[i]==1'b1) begin
            //         v_pc_queue_en[i] <= 1'b1;
            //     end
            //     else if( |v_rf_commit_en && ((i>=rd_ptr) && (i<rd_ptr_nxt)) ||  (rd_ptr_over && ((i>=rd_ptr) || (i+COMMIT_QUEUE_DEPTH)<{rd_ptr_over,rd_ptr_nxt})) )  begin
            //         v_pc_queue_en[i] <= 1'b0;
            //     end 
            // end

        end

    endgenerate



    //=================================================
    // rd logic  
    //=================================================
    assign rd_ptr_over = rd_ptr_nxt<rd_ptr  ;
    assign rd_ptr_nxt  = rd_ptr + rd_ptr_add;
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            rd_ptr <= 0;
        end
        else if(cancel_en)begin
            rd_ptr <= 0;
        end
        else if(|v_rf_commit_en)begin
            rd_ptr <= rd_ptr_nxt;
        end
    end


    //todo need update
    always_comb begin
        if(&v_rf_commit_en[3:0])begin
            rd_ptr_add = 4;
        end
        else if(&v_rf_commit_en[2:0])begin
            rd_ptr_add = 3;
        end
        else if(&v_rf_commit_en[1:0])begin
            rd_ptr_add = 2;
        end
        else if(v_rf_commit_en[0])begin
            rd_ptr_add = 1;
        end
        else begin
            rd_ptr_add = 0;
        end
    end

    //=================================================
    // correct logic  
    //=================================================

    // always_ff @(posedge clk or negedge rst_n) begin
    //     if(~rst_n)begin
    //         commit_pc_store <= 0;
    //     end
    //     else if(|v_rf_commit_en)begin
    //         commit_pc_store <= v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].inst_nxt_pc;
    //     end
    // end


    //=================================================
    // output logic  
    //=================================================

    assign cancel_edge_en           = |v_cancel_edge_en;

    assign commit_credit_rel_en     = |v_rf_commit_en;
    assign commit_credit_rel_num    = rd_ptr_add;

    assign v_rf_commit_en[0]        = v_commit_en_series[0];
    assign v_commit_error_en[0]     = v_cancel_edge_en[0];
    assign v_commit_en_series[0]    = v_commit_queue_en[rd_ptr];

    generate
        for(genvar i=1;i<COMMIT_REL_CHANNEL;i=i+1)begin
            assign v_commit_en_series[i]    = v_commit_en_series[i-1] & v_commit_queue_en[DEPTH_WIDTH'(rd_ptr+i)];
            assign v_rf_commit_en[i]        = v_commit_en_series[i] & (&v_correct_en[i-1:0]);
            assign v_commit_error_en[i]     = v_cancel_edge_en[i] & ~|v_cancel_edge_en[i-1:0];
        end
        for(genvar j=0;j<COMMIT_REL_CHANNEL;j=j+1)begin
            assign v_rf_commit_pld[j]       = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)];
            assign v_correct_en[j]          = ~v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.commit_error;
            assign v_cancel_edge_en[j]      = ~v_correct_en[j] & v_commit_en_series[j] ;
            assign v_st_ack_commit_en[j]    = v_rf_commit_en[j] & v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].stq_commit_entry_en;
            assign v_st_ack_commit_entry[j] = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].stq_commit_entry;
            
            // assign v_full_offset[j]                  = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].inst_pc - v_be_pld[DEPTH_WIDTH'(rd_ptr+j)].pred_pc;
            assign v_bp_commit_pld[j].bypass.offset  = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.offset;
            assign v_bp_commit_pld[j].bypass.pred_pc = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_common_pld.pred_pc;
            assign v_bp_commit_pld[j].bypass.taken   = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.taken;
            assign v_bp_commit_pld[j].bypass.tgt_pc  = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.inst_nxt_pc;
            assign v_bp_commit_pld[j].is_call        = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_common_pld.is_call;
            assign v_bp_commit_pld[j].is_ret         = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_common_pld.is_ret;
            assign v_bp_commit_pld[j].is_last        = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.is_last;
            assign v_bp_commit_pld[j].bypass.is_cext = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_common_pld.is_cext;
            assign v_bp_commit_pld[j].bypass.carry   = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_common_pld.carry;
            assign v_bp_commit_pld[j].pc             = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_common_pld.inst_pc;
            assign v_bp_commit_pld[j].taken_err      = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.taken_err;
            assign v_bp_commit_pld[j].taken_pend     = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+j)].commit_bp_branch_pld.taken_pend;
        end

    endgenerate

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            cancel_edge_en_d <= 1'b0;
        end
        else begin
            cancel_edge_en_d <= cancel_edge_en;
        end
    end
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            cancel_cnt <= CANCEL_CNT_NUM;
        end
        else if(cancel_edge_en)begin
            cancel_cnt <= 0;
        end
        else if(cancel_cnt<CANCEL_CNT_NUM)begin
            cancel_cnt <= cancel_cnt + 1;
        end
        
    end
    assign cancel_en = cancel_edge_en | (cancel_cnt<CANCEL_CNT_NUM);

//==========================================================================
// csr inst num
//==========================================================================

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                 csr_INSTRET <= 64'b0;
        else if(v_rf_commit_en[3]) csr_INSTRET <= csr_INSTRET + 4;
        else if(v_rf_commit_en[2]) csr_INSTRET <= csr_INSTRET + 3;
        else if(v_rf_commit_en[1]) csr_INSTRET <= csr_INSTRET + 2;
        else if(v_rf_commit_en[0]) csr_INSTRET <= csr_INSTRET + 1;
    end
//==========================================================================
// Fcsr backup
//==========================================================================
    logic [7:0] fcsr_mask [COMMIT_REL_CHANNEL-1:0];
    logic [7:0] fcsr_data [COMMIT_REL_CHANNEL-1:0];
    logic [7:0] fcsr_mask_backup;
    logic [7:0] fcsr_data_backup;
    generate
        for(genvar m=COMMIT_REL_CHANNEL-1;m>=0;m=m-1)begin
            if(m==COMMIT_REL_CHANNEL-1)begin
                assign fcsr_mask[COMMIT_REL_CHANNEL-1] = 8'hff;
                assign fcsr_data[m] = v_rf_commit_pld[m].FCSR_en & v_rf_commit_pld[m].FCSR_data & {8{v_rf_commit_en[m]}};
            end
            else begin
                assign fcsr_mask[m] = (fcsr_mask[m+1] & ~v_rf_commit_pld[m+1].FCSR_en ) | {8{~v_rf_commit_en[m+1]}};
                assign fcsr_data[m] = fcsr_data[m+1] |(fcsr_mask[m] & v_rf_commit_pld[m].FCSR_en & v_rf_commit_pld[m].FCSR_data & {8{v_rf_commit_en[m]}});
            end
        end
    endgenerate
    assign fcsr_mask_backup = fcsr_mask[0] & ~v_rf_commit_pld[0].FCSR_en | {8{~v_rf_commit_en[0]}};
    assign fcsr_data_backup = fcsr_data[0] | (fcsr_mask_backup & FCSR_backup);

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            FCSR_backup <= 8'b0;
        end
        else if(~&fcsr_mask_backup & |v_rf_commit_en)begin
            FCSR_backup <= fcsr_data_backup;
        end
        
    end



//===============================================================================
// Simulation todo
//===============================================================================

    `ifdef TOY_SIM
    //=================================================
    // flatten 4 to 128 cross bar
    //=================================================

    assign v_s_pc_en        = v_instruction_vld & v_instruction_rdy;
    // assign v_s_pc_pld       = v_instruction_pc   ;


    generate 
        for (genvar i = 0;i<COMMIT_QUEUE_DEPTH ;i=i+1 ) begin
            for (genvar j = 0;j<INST_READ_CHANNEL ;j=j+1 ) begin
                assign vv_pc_en[i][j] = (i == v_instruction_idx[j]) & v_s_pc_en[j];
            end
            assign v_be_queue_update_pld[i] = 
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][0]}} & v_inst_fe_pld[0]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][1]}} & v_inst_fe_pld[1]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][2]}} & v_inst_fe_pld[2]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][3]}} & v_inst_fe_pld[3]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][4]}} & v_inst_fe_pld[4]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][5]}} & v_inst_fe_pld[5]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][6]}} & v_inst_fe_pld[6]) |
                        ({($bits(fe_bypass_pkg)){vv_pc_en[i][7]}} & v_inst_fe_pld[7]) ;
            assign v_pc_queue_update_en[i] = |vv_pc_en[i];
        end
    endgenerate
    //=================================================
    // commit mem  
    //=================================================
    generate
        for(genvar i=0;i<COMMIT_QUEUE_DEPTH;i=i+1)begin
            // always_ff @(posedge clk or negedge rst_n) begin
            //     if(~rst_n)begin
            //         v_pc_queue_mem[i] <= {(ADDR_WIDTH){1'b0}};
            //     end
            //     else if(v_pc_queue_update_en[i]==1'b1)begin
            //         v_pc_queue_mem[i] <= v_pc_queue_update_pld[i];
            //     end
            // end

            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_be_pld[i] <= {$bits(fe_bypass_pkg){1'b0}};
                end
                else if(v_pc_queue_update_en[i]==1'b1)begin
                    v_be_pld[i] <= v_be_queue_update_pld[i];
                end
            end

            // always_ff @(posedge clk or negedge rst_n) begin
            //     if(~rst_n)begin
            //         v_pc_queue_en[i] <= 1'b0;
            //     end
            //     else if(cancel_en) begin
            //         v_pc_queue_en[i] <= 1'b0;
            //     end
            //     else if(v_pc_queue_update_en[i]==1'b1) begin
            //         v_pc_queue_en[i] <= 1'b1;
            //     end
            //     else if( |v_rf_commit_en && ((i>=rd_ptr) && (i<rd_ptr_nxt)) ||  (rd_ptr_over && ((i>=rd_ptr) || (i+COMMIT_QUEUE_DEPTH)<{rd_ptr_over,rd_ptr_nxt})) )  begin
            //         v_pc_queue_en[i] <= 1'b0;
            //     end 
            // end

        end

    endgenerate


    logic [63:0] cycle;
    logic [63:0] pred_num;
    logic [63:0] cancel_inst_cnt;
    logic [REG_WIDTH-1       :0] v_reg_phy_data [PHY_REG_NUM-1 :0];
    logic [PHY_REG_ID_WIDTH-1:0] v_reg_phy_id [ARCH_ENTRY_NUM-1:0];

    logic [3:0] ras_error;
    logic [3:0] offset_error;
    logic [3:0] taken_error;
    logic [3:0] ras_miss_error;
    logic [3:0] ind_error;
    logic [63:0] ras_error_cnt;
    logic [63:0] btb_error_cnt;
    logic [63:0] ind_btb_error_cnt;
    logic [63:0] ras_miss_error_cnt;
    logic [63:0] tage_error_cnt;

int file;
  initial begin
    file = $fopen("output.txt", "a");
    forever begin
            @(posedge clk)
            for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                if(v_commit_error_en[a]) begin
                    $fdisplay(file, "[cycle=%0d][v_bp_commit_pld=%h]", cycle, v_bp_commit_pld[a]);
                end                    
            end
    end
    $fclose(file);
  end 

int file1;
  initial begin
    file1 = $fopen("st_ack.txt", "a");
    forever begin
            @(posedge clk)
            for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                if(v_st_ack_commit_en[a]) begin
                    $fdisplay(file1, "[cycle=%0d][v_st_ack_commit_entry=%h]", cycle, v_st_ack_commit_entry[a]);
                end                    
            end
    end
    $fclose(file1);
  end 

int file2;
  initial begin
    file2 = $fopen("cancel_en.txt", "a");
    forever begin
            @(posedge clk)
            if(cancel_en) begin
                $fdisplay(file2, "[cycle=%0d]", cycle);
            end                    
    end
    $fclose(file2);
  end 

int file3;
  initial begin
    file3 = $fopen("v_rf_commit_en", "a");
    forever begin
            @(posedge clk)
            for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                if(v_rf_commit_en[a]) begin
                    $fdisplay(file3, "[cycle=%0d]", cycle);
                end                    
            end
    end
    $fclose(file3);
  end 

    generate
        for(genvar a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
            assign ras_error[a] = (v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+a)].commit_common_pld.is_ret && v_be_pld[DEPTH_WIDTH'(rd_ptr+a)].is_ret);
            assign offset_error[a] = (v_full_offset[a]>>2) != v_be_pld[DEPTH_WIDTH'(rd_ptr+a)].offset;
            assign taken_error[a] = (v_bp_commit_pld[a].bypass.taken != v_be_pld[DEPTH_WIDTH'(rd_ptr+a)].taken);
            assign ras_miss_error[a] = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+a)].commit_common_pld.is_ret;
            //assign ind_error[a] = v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+a)].is_ind && ~v_commit_queue_mem[DEPTH_WIDTH'(rd_ptr+a)].commit_common_pld.is_ret; \\*** add \\
        end
    endgenerate

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin                     
            ras_error_cnt <= 0;
            btb_error_cnt <= 0;
            tage_error_cnt <= 0;
            ras_miss_error_cnt <= 0;
            ind_btb_error_cnt <= 0;
        end
        else if(cancel_edge_en) begin         
            ras_error_cnt <=  (|(v_commit_error_en&(ras_error&~offset_error&~taken_error))) ? (ras_error_cnt + 1)  : ras_error_cnt;
            btb_error_cnt <=  (|(v_commit_error_en&(~taken_error))) ? (btb_error_cnt + 1)  : btb_error_cnt;
            tage_error_cnt <= (|(v_commit_error_en&taken_error)) ? (tage_error_cnt + 1) : tage_error_cnt;
            ras_miss_error_cnt <= (|(v_commit_error_en&(~taken_error)&ras_miss_error)) ? (ras_miss_error_cnt + 1)  : ras_miss_error_cnt;
            ind_btb_error_cnt <= (|(v_commit_error_en&(~taken_error)&ind_error)) ? (ind_btb_error_cnt + 1)  : ind_btb_error_cnt;
        end
    end 

    logic [PHY_REG_ID_WIDTH-1:0] v_reg_phy_id_0[ARCH_ENTRY_NUM-1:0];
    logic [PHY_REG_ID_WIDTH-1:0] v_reg_phy_id_1[ARCH_ENTRY_NUM-1:0];
    logic [PHY_REG_ID_WIDTH-1:0] v_reg_phy_id_2[ARCH_ENTRY_NUM-1:0];
    logic [PHY_REG_ID_WIDTH-1:0] v_reg_phy_id_3[ARCH_ENTRY_NUM-1:0];


    assign v_reg_phy_data = u_toy_scalar.u_core.u_toy_issue.u_toy_physicial_regfile_data.v_int_phy_data;
    assign v_reg_phy_id = u_toy_scalar.u_core.u_toy_issue.u_toy_backup_rename_regfile_top.v_int_backup_phy_id;
    always_comb begin 
        v_reg_phy_id_0 = v_reg_phy_id;
        if(v_rf_commit_pld[0].commit_common_pld.rd_en)begin
            v_reg_phy_id_0[v_rf_commit_pld[0].commit_common_pld.arch_reg_index] = v_rf_commit_pld[0].commit_common_pld.phy_reg_index;
        end
        v_reg_phy_id_1 = v_reg_phy_id_0;
        if(v_rf_commit_pld[1].commit_common_pld.rd_en)begin
            v_reg_phy_id_1[v_rf_commit_pld[1].commit_common_pld.arch_reg_index] = v_rf_commit_pld[1].commit_common_pld.phy_reg_index;
        end
        v_reg_phy_id_2 = v_reg_phy_id_1;
        if(v_rf_commit_pld[2].commit_common_pld.rd_en)begin
            v_reg_phy_id_2[v_rf_commit_pld[2].commit_common_pld.arch_reg_index] = v_rf_commit_pld[2].commit_common_pld.phy_reg_index;
        end
        v_reg_phy_id_3 = v_reg_phy_id_2;
        if(v_rf_commit_pld[3].commit_common_pld.rd_en)begin
            v_reg_phy_id_3[v_rf_commit_pld[3].commit_common_pld.arch_reg_index] = v_rf_commit_pld[3].commit_common_pld.phy_reg_index;
        end
    end
    initial begin
        string  fname1   ;
        int     fhandle1 ;
        if($value$plusargs("REG_TRACE=%s", fname1)) begin
            fhandle1 = $fopen(fname1, "w");
            forever begin
                @(posedge clk)
                // for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                    if(v_rf_commit_en[0]) begin
                        // $fdisplay(fhandle, "[pc=%h][inst_id=%h][cycle=%0d]", v_rf_commit_pld[a].inst_pc, v_rf_commit_pld[a].inst_id, cycle);
                        $fdisplay(fhandle1, "[pc=%h][cycle=%0d][00:%h 01:%h 02:%h 03:%h 04:%h 05:%h 06:%h 07:%h 08:%h 09:%h 10:%h 11:%h 12:%h 13:%h 14:%h 15:%h 16:%h 17:%h 18:%h 19:%h 20:%h 21:%h 22:%h 23:%h 24:%h 25:%h 26:%h 27:%h 28:%h 29:%h 30:%h 31:%h]",
                        v_rf_commit_pld[0].commit_common_pld.inst_pc, cycle,
                        v_reg_phy_data[v_reg_phy_id_0[0]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[1]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[2]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[3]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[4]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[5]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[6]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[7]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[8]]  ,
                        v_reg_phy_data[v_reg_phy_id_0[9]] ,
                        v_reg_phy_data[v_reg_phy_id_0[10]] ,
                        v_reg_phy_data[v_reg_phy_id_0[11]] ,
                        v_reg_phy_data[v_reg_phy_id_0[12]] ,
                        v_reg_phy_data[v_reg_phy_id_0[13]] ,
                        v_reg_phy_data[v_reg_phy_id_0[14]] ,
                        v_reg_phy_data[v_reg_phy_id_0[15]] ,
                        v_reg_phy_data[v_reg_phy_id_0[16]] ,
                        v_reg_phy_data[v_reg_phy_id_0[17]] ,
                        v_reg_phy_data[v_reg_phy_id_0[18]] ,
                        v_reg_phy_data[v_reg_phy_id_0[19]] ,
                        v_reg_phy_data[v_reg_phy_id_0[20]] ,
                        v_reg_phy_data[v_reg_phy_id_0[21]] ,
                        v_reg_phy_data[v_reg_phy_id_0[22]] ,
                        v_reg_phy_data[v_reg_phy_id_0[23]] ,
                        v_reg_phy_data[v_reg_phy_id_0[24]] ,
                        v_reg_phy_data[v_reg_phy_id_0[25]] ,
                        v_reg_phy_data[v_reg_phy_id_0[26]] ,
                        v_reg_phy_data[v_reg_phy_id_0[27]] ,
                        v_reg_phy_data[v_reg_phy_id_0[28]] ,
                        v_reg_phy_data[v_reg_phy_id_0[29]] ,
                        v_reg_phy_data[v_reg_phy_id_0[30]] ,
                        v_reg_phy_data[v_reg_phy_id_0[31]] ,
                         
                         );
                    end

                    if(v_rf_commit_en[1]) begin
                        // $fdisplay(fhandle, "[pc=%h][inst_id=%h][cycle=%0d]", v_rf_commit_pld[a].inst_pc, v_rf_commit_pld[a].inst_id, cycle);
                        $fdisplay(fhandle1, "[pc=%h][cycle=%0d][00:%h 01:%h 02:%h 03:%h 04:%h 05:%h 06:%h 07:%h 08:%h 09:%h 10:%h 11:%h 12:%h 13:%h 14:%h 15:%h 16:%h 17:%h 18:%h 19:%h 20:%h 21:%h 22:%h 23:%h 24:%h 25:%h 26:%h 27:%h 28:%h 29:%h 30:%h 31:%h]",
                        v_rf_commit_pld[1].commit_common_pld.inst_pc, cycle,
                        v_reg_phy_data[v_reg_phy_id_1[0]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[1]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[2]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[3]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[4]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[5]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[6]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[7]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[8]]  ,
                        v_reg_phy_data[v_reg_phy_id_1[9]] ,
                        v_reg_phy_data[v_reg_phy_id_1[10]] ,
                        v_reg_phy_data[v_reg_phy_id_1[11]] ,
                        v_reg_phy_data[v_reg_phy_id_1[12]] ,
                        v_reg_phy_data[v_reg_phy_id_1[13]] ,
                        v_reg_phy_data[v_reg_phy_id_1[14]] ,
                        v_reg_phy_data[v_reg_phy_id_1[15]] ,
                        v_reg_phy_data[v_reg_phy_id_1[16]] ,
                        v_reg_phy_data[v_reg_phy_id_1[17]] ,
                        v_reg_phy_data[v_reg_phy_id_1[18]] ,
                        v_reg_phy_data[v_reg_phy_id_1[19]] ,
                        v_reg_phy_data[v_reg_phy_id_1[20]] ,
                        v_reg_phy_data[v_reg_phy_id_1[21]] ,
                        v_reg_phy_data[v_reg_phy_id_1[22]] ,
                        v_reg_phy_data[v_reg_phy_id_1[23]] ,
                        v_reg_phy_data[v_reg_phy_id_1[24]] ,
                        v_reg_phy_data[v_reg_phy_id_1[25]] ,
                        v_reg_phy_data[v_reg_phy_id_1[26]] ,
                        v_reg_phy_data[v_reg_phy_id_1[27]] ,
                        v_reg_phy_data[v_reg_phy_id_1[28]] ,
                        v_reg_phy_data[v_reg_phy_id_1[29]] ,
                        v_reg_phy_data[v_reg_phy_id_1[30]] ,
                        v_reg_phy_data[v_reg_phy_id_1[31]] ,
                         
                         );
                    end

                    if(v_rf_commit_en[2]) begin
                        // $fdisplay(fhandle, "[pc=%h][inst_id=%h][cycle=%0d]", v_rf_commit_pld[a].inst_pc, v_rf_commit_pld[a].inst_id, cycle);
                        $fdisplay(fhandle1, "[pc=%h][cycle=%0d][00:%h 01:%h 02:%h 03:%h 04:%h 05:%h 06:%h 07:%h 08:%h 09:%h 10:%h 11:%h 12:%h 13:%h 14:%h 15:%h 16:%h 17:%h 18:%h 19:%h 20:%h 21:%h 22:%h 23:%h 24:%h 25:%h 26:%h 27:%h 28:%h 29:%h 30:%h 31:%h]",
                        v_rf_commit_pld[2].commit_common_pld.inst_pc, cycle,
                        v_reg_phy_data[v_reg_phy_id_2[0]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[1]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[2]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[3]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[4]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[5]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[6]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[7]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[8]]  ,
                        v_reg_phy_data[v_reg_phy_id_2[9]] ,
                        v_reg_phy_data[v_reg_phy_id_2[10]] ,
                        v_reg_phy_data[v_reg_phy_id_2[11]] ,
                        v_reg_phy_data[v_reg_phy_id_2[12]] ,
                        v_reg_phy_data[v_reg_phy_id_2[13]] ,
                        v_reg_phy_data[v_reg_phy_id_2[14]] ,
                        v_reg_phy_data[v_reg_phy_id_2[15]] ,
                        v_reg_phy_data[v_reg_phy_id_2[16]] ,
                        v_reg_phy_data[v_reg_phy_id_2[17]] ,
                        v_reg_phy_data[v_reg_phy_id_2[18]] ,
                        v_reg_phy_data[v_reg_phy_id_2[19]] ,
                        v_reg_phy_data[v_reg_phy_id_2[20]] ,
                        v_reg_phy_data[v_reg_phy_id_2[21]] ,
                        v_reg_phy_data[v_reg_phy_id_2[22]] ,
                        v_reg_phy_data[v_reg_phy_id_2[23]] ,
                        v_reg_phy_data[v_reg_phy_id_2[24]] ,
                        v_reg_phy_data[v_reg_phy_id_2[25]] ,
                        v_reg_phy_data[v_reg_phy_id_2[26]] ,
                        v_reg_phy_data[v_reg_phy_id_2[27]] ,
                        v_reg_phy_data[v_reg_phy_id_2[28]] ,
                        v_reg_phy_data[v_reg_phy_id_2[29]] ,
                        v_reg_phy_data[v_reg_phy_id_2[30]] ,
                        v_reg_phy_data[v_reg_phy_id_2[31]] ,
                         
                         );
                    end

                    if(v_rf_commit_en[3]) begin
                        // $fdisplay(fhandle, "[pc=%h][inst_id=%h][cycle=%0d]", v_rf_commit_pld[a].inst_pc, v_rf_commit_pld[a].inst_id, cycle);
                        $fdisplay(fhandle1, "[pc=%h][cycle=%0d][00:%h 01:%h 02:%h 03:%h 04:%h 05:%h 06:%h 07:%h 08:%h 09:%h 10:%h 11:%h 12:%h 13:%h 14:%h 15:%h 16:%h 17:%h 18:%h 19:%h 20:%h 21:%h 22:%h 23:%h 24:%h 25:%h 26:%h 27:%h 28:%h 29:%h 30:%h 31:%h]",
                        v_rf_commit_pld[3].commit_common_pld.inst_pc, cycle,
                        v_reg_phy_data[v_reg_phy_id_3[0]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[1]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[2]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[3]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[4]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[5]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[6]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[7]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[8]]  ,
                        v_reg_phy_data[v_reg_phy_id_3[9]] ,
                        v_reg_phy_data[v_reg_phy_id_3[10]] ,
                        v_reg_phy_data[v_reg_phy_id_3[11]] ,
                        v_reg_phy_data[v_reg_phy_id_3[12]] ,
                        v_reg_phy_data[v_reg_phy_id_3[13]] ,
                        v_reg_phy_data[v_reg_phy_id_3[14]] ,
                        v_reg_phy_data[v_reg_phy_id_3[15]] ,
                        v_reg_phy_data[v_reg_phy_id_3[16]] ,
                        v_reg_phy_data[v_reg_phy_id_3[17]] ,
                        v_reg_phy_data[v_reg_phy_id_3[18]] ,
                        v_reg_phy_data[v_reg_phy_id_3[19]] ,
                        v_reg_phy_data[v_reg_phy_id_3[20]] ,
                        v_reg_phy_data[v_reg_phy_id_3[21]] ,
                        v_reg_phy_data[v_reg_phy_id_3[22]] ,
                        v_reg_phy_data[v_reg_phy_id_3[23]] ,
                        v_reg_phy_data[v_reg_phy_id_3[24]] ,
                        v_reg_phy_data[v_reg_phy_id_3[25]] ,
                        v_reg_phy_data[v_reg_phy_id_3[26]] ,
                        v_reg_phy_data[v_reg_phy_id_3[27]] ,
                        v_reg_phy_data[v_reg_phy_id_3[28]] ,
                        v_reg_phy_data[v_reg_phy_id_3[29]] ,
                        v_reg_phy_data[v_reg_phy_id_3[30]] ,
                        v_reg_phy_data[v_reg_phy_id_3[31]] ,
                         
                         );
                    end

                end
            end
        // end
    end


    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)  cycle <= 0;
        else        cycle <= cycle + 1;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                      cancel_inst_cnt <= 0;
        else if(cancel_edge_en)         cancel_inst_cnt <= cancel_inst_cnt + 1;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                 pred_num <= 64'b0;
        else if(v_rf_commit_en[3]) pred_num <= pred_num + 4;
        else if(v_rf_commit_en[2]) pred_num <= pred_num + 3;
        else if(v_rf_commit_en[1]) pred_num <= pred_num + 2;
        else if(v_rf_commit_en[0]) pred_num <= pred_num + 1;
    end

    logic [63:0] inst_1k;
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                 inst_1k <= 64'b0;
        else if(inst_1k>=99999)    inst_1k <= 64'b0;
        else if(v_rf_commit_en[3]) inst_1k <= inst_1k + 4;
        else if(v_rf_commit_en[2]) inst_1k <= inst_1k + 3;
        else if(v_rf_commit_en[1]) inst_1k <= inst_1k + 2;
        else if(v_rf_commit_en[0]) inst_1k <= inst_1k + 1;
    end
    logic [63:0] num_error;

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            num_error <= 0;
        end
        else if(inst_1k>=99999)begin
            num_error <= 0;
        end
        else if(cancel_edge_en)begin
            num_error <= num_error + 1;
        end
    end

    logic [63:0] btb_error_cnt_;
    logic [63:0] tage_error_cnt_;

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin                     
            btb_error_cnt_ <= 0;
            tage_error_cnt_ <= 0;
        end
        else if(inst_1k>=99999)begin
            btb_error_cnt_ <= 0;
            tage_error_cnt_ <= 0;
        end
        else if(cancel_edge_en) begin         
            btb_error_cnt_ <=  (|(v_commit_error_en&(~taken_error))) ? (btb_error_cnt_ + 1)  : btb_error_cnt_;
            tage_error_cnt_ <= (|(v_commit_error_en&taken_error)) ? (tage_error_cnt_ + 1) : tage_error_cnt_;
        end
    end

    initial begin
        forever begin
            @(posedge clk)
            for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                if(v_commit_error_en[a]) begin
                    if (!taken_error[a] && !offset_error[a] && ras_error[a]) begin 
                        $display("[pc=%h][inst=%h][cycle=%0d]:ERROR TYPE: ras ERROR", v_bp_commit_pld[a].pc, v_rf_commit_pld[a].commit_common_pld.inst_val, cycle);
                    end
                    
                end
            end
        end
    end
    

    initial begin
        forever begin
            @(posedge clk)
            if(inst_1k>=99999) begin
                $display("[cycle=%0d][mpki=%0f][tage error=%0d][btb error=%0d]", cycle, (real'(num_error) * 1000.0) / real'(inst_1k), tage_error_cnt_, btb_error_cnt_);
            end
        end
    end

    logic [31:0] real_next_pc;

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                 real_next_pc <= 32'h8000_0000;
        else if(v_rf_commit_en[3]) real_next_pc <= v_bp_commit_pld[3].bypass.tgt_pc;
        else if(v_rf_commit_en[2]) real_next_pc <= v_bp_commit_pld[2].bypass.tgt_pc;
        else if(v_rf_commit_en[1]) real_next_pc <= v_bp_commit_pld[1].bypass.tgt_pc;
        else if(v_rf_commit_en[0]) real_next_pc <= v_bp_commit_pld[0].bypass.tgt_pc;
    end

    initial begin
        forever begin
            @(posedge clk)
            for(int a=0; a<COMMIT_REL_CHANNEL;a=a+1)begin
                if(v_rf_commit_en[a]) begin
                    if((a==0) && (v_rf_commit_pld[a].commit_common_pld.inst_pc!=real_next_pc)) begin
                        $display("Error Detect: [pc=%h][pc_next=%h][cycle=%0d]", v_rf_commit_pld[a].commit_common_pld.inst_pc, real_next_pc, cycle);
                    end else if(v_rf_commit_pld[a].commit_common_pld.inst_pc!=v_rf_commit_pld[a-1].commit_bp_branch_pld.inst_nxt_pc) begin
                        $display("Error Detect: [pc=%h][pc_next=%h][cycle=%0d]", v_rf_commit_pld[a].commit_common_pld.inst_pc, real_next_pc, cycle);
                    end
                end
            end
        end
    end


    initial begin
        string  fname   ;
        int     fhandle ;
        if($value$plusargs("PC=%s", fname)) begin
            fhandle = $fopen(fname, "w");
            forever begin
                @(posedge clk)
                for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                    if(v_rf_commit_en[a]) begin
                        // $fdisplay(fhandle, "[pc=%h][inst_id=%h][cycle=%0d]", v_rf_commit_pld[a].inst_pc, v_rf_commit_pld[a].inst_id, cycle);
                        $fdisplay(fhandle, "[pc=%h][inst=%h][inst_id=%h][cycle=%0d][btb err: %0d]", v_rf_commit_pld[a].commit_common_pld.inst_pc, v_rf_commit_pld[a].commit_common_pld.inst_val, v_rf_commit_pld[a].inst_id, cycle, (v_commit_error_en[a]&(~taken_error[a])));
                    end
                end
            end
        end
    end

    initial begin
        if($test$plusargs("DEBUG")) begin
            forever begin
                @(posedge clk)
                for(int a=0;a<COMMIT_REL_CHANNEL;a=a+1)begin
                    if(v_rf_commit_en[a]) begin
                        $display("[pc=%h][inst_id=%h][cycle=%0d]", v_rf_commit_pld[a].commit_common_pld.inst_pc,v_rf_commit_pld[a].inst_id, cycle);
                    end
                end
            end
        end
    end

    `endif


endmodule
