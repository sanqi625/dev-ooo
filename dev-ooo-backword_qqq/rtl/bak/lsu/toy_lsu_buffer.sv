module toy_lsu_buffer 
    import toy_pack::*;
#(
    parameter   int unsigned S_CHANNEL  = 4                     ,
    parameter   int unsigned DEPTH      = 16                    
)
(
    input  logic                                clk                             ,
    input  logic                                rst_n                           ,

    input  logic [S_CHANNEL-1       :0]         v_s_lsu_vld                     ,
    input  lsu_pkg                              v_s_lsu_pld [S_CHANNEL-1    :0] ,
    output logic [$clog2(DEPTH)     :0]         lsu_buffer_rd_ptr               ,
    input  logic [REG_WIDTH-1       :0]         v_forward_data                  [EU_NUM-1           :0],

    output logic [STU_CHANNEL-1     :0]         v_m_stu_vld                     ,
    output logic [LDU_CHANNEL-1     :0]         v_m_ldu_vld                     ,
    input  logic [1                 :0]         v_lsu_rdy                       ,
    input  logic [1                 :0]         v_ldq_rdy                       ,
    input  logic                                stq_rdy                         ,
    output lsu_pkg                              v_m_stu_pld [LDU_CHANNEL-1  :0] ,
    output lsu_pkg                              v_m_ldu_pld [LDU_CHANNEL-1  :0] ,

    input logic                                 cancel_en                       ,

    input logic                                 stu_credit_en                   ,
    input logic  [3                 :0]         stu_credit_num                  ,
    input logic  [$clog2(STU_DEPTH)-1:0]        stq_commit_cnt                  ,

    input logic                                 ldu_credit_en                   ,
    input logic  [3                 :0]         ldu_credit_num                  
);

    //==============================
    // parameter
    //==============================
    localparam DEPTH_WIDTH = $clog2(DEPTH)                          ;
    localparam QUEUE_CNT_WIDTH = $clog2(DEPTH)+1                    ;

    //============================== 
    // logic
    //==============================
    genvar i;
    logic                               stu_credit_can_use          ;
    logic                               ldu_credit_can_use          ;
    logic [S_CHANNEL-1          :0]     v_wr_en                     ;
    logic                               wr_ptr_over                 ;
    logic                               rd_ptr_over                 ;
    logic [3                    :0]     v_rd_en                     ;
    logic [$clog2(DEPTH)        :0]     rd_ptr                      ;
    logic [$clog2(DEPTH)        :0]     rd_ptr_nxt                  ;

    logic [$clog2(DEPTH)-1      :0]     wr_ptr                      ;
    logic [$clog2(DEPTH)-1      :0]     wr_ptr_nxt                  ;
    logic [DEPTH-1              :0]     v_forward_rs1_en_reg        ;
    logic [DEPTH-1              :0]     v_forward_rs2_en_reg        ;
    logic [DEPTH-1              :0]     v_pld_en                    ;
    logic [$clog2(STU_DEPTH)    :0]     stu_credit_cnt              ;
    logic [$clog2(LDU_DEPTH)    :0]     ldu_credit_cnt              ;
    logic [1                    :0]     stu_sub                     ;
    logic [1                    :0]     ldu_sub                     ;
    logic [3                    :0]     stu_add                     ;
    logic [3                    :0]     ldu_add                     ;
    logic [1                    :0]     v_pld_stu_en                ;
    logic [1                    :0]     v_pld_ldu_en                ;  
    logic [1                    :0]     rd_ptr_add                  ;         

    logic [QUEUE_CNT_WIDTH-1    :0]     queue_cnt                   ;
    logic [QUEUE_CNT_WIDTH-1    :0]     queue_calculate             ;
    logic [QUEUE_CNT_WIDTH-1    :0]     queue_residue               ;
    logic [1:0] v_m_lsu_vld;

    logic [$clog2(S_CHANNEL)    :0]     s_order     [S_CHANNEL-1    :0] ;
    logic [DEPTH-1              :0]     v_wr_bitmap [S_CHANNEL-1    :0] ;
    lsu_pkg                             v_pld_mem   [DEPTH-1        :0] ;
    lsu_pkg                             v_m_pld     [LDU_CHANNEL-1  :0] ;
    lsu_pkg                             v_wr_pld    [DEPTH-1        :0] ;
    logic [DEPTH-1              :0]     vv_pld_wr_en[S_CHANNEL-1    :0] ;
    logic [DEPTH-1              :0]     vv_forward_rs1_en[S_CHANNEL-1:0];
    logic [DEPTH-1              :0]     vv_forward_rs2_en[S_CHANNEL-1:0];
    logic [DEPTH-1              :0]     v_pld_wr_en                     ;
    logic [DEPTH-1              :0]     v_forward_rs1_en                ;
    logic [DEPTH-1              :0]     v_forward_rs2_en                ;



    //==============================
    // logic 
    //==============================
    assign v_wr_en = v_s_lsu_vld;

    assign v_rd_en =   {v_m_stu_vld,v_m_ldu_vld} & {v_lsu_rdy,v_ldq_rdy};
    
    assign rd_ptr_add = 3'(v_rd_en[0] + v_rd_en[1] + v_rd_en[2] +v_rd_en[3]);

    assign lsu_buffer_rd_ptr = rd_ptr;
    //==============================
    // credit
    //==============================


    assign stu_sub = v_m_stu_vld[1] ? 2'd2 :
                     (v_m_stu_vld[0] & stq_rdy) ? 2'd1 : 2'd0;
    assign ldu_sub = (v_m_ldu_vld[1] & v_ldq_rdy[1]) ? 2'd2 :
                     (v_m_ldu_vld[0] & v_ldq_rdy[0]) ? 2'd1 : 2'd0;
    assign stu_add = stu_credit_en ? stu_credit_num : 0 ;
    assign ldu_add = ldu_credit_en ? ldu_credit_num : 0 ;

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            stu_credit_cnt <= STU_DEPTH;
        end
        else if(cancel_en)begin
            stu_credit_cnt <= STU_DEPTH - stq_commit_cnt;
        end
        else if((|stu_sub) || stu_credit_en)begin
            stu_credit_cnt <= stu_credit_cnt + stu_add - stu_sub;
        end
    end
    assign stu_credit_can_use = (stu_credit_cnt>1);
    
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            ldu_credit_cnt <= LDU_DEPTH;
        end
        else if(cancel_en)begin
            ldu_credit_cnt <= LDU_DEPTH;
        end
        else if((|ldu_sub) || ldu_credit_en)begin
            ldu_credit_cnt <= ldu_credit_cnt + ldu_add - ldu_sub;
        end
    end

    assign ldu_credit_can_use = (ldu_credit_cnt>1);


    //==============================
    // rd ptr
    //==============================
    assign rd_ptr_nxt = rd_ptr + rd_ptr_add;
    assign rd_ptr_over = rd_ptr_nxt[LSU_DEPTH_WIDTH-1:0]<rd_ptr[LSU_DEPTH_WIDTH-1:0]  ;
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            rd_ptr <= 0;
        end
        else if(cancel_en)begin
            rd_ptr <= 0;
        end
        else begin
            rd_ptr <= rd_ptr_nxt;
        end
    end

    //==============================
    // read control 
    //==============================

    assign v_m_lsu_vld = {v_pld_en[DEPTH_WIDTH'(rd_ptr[LSU_DEPTH_WIDTH-1:0]+1)],v_pld_en[rd_ptr[LSU_DEPTH_WIDTH-1:0]]};

    assign v_pld_stu_en   = {v_m_pld[1].stu_en,v_m_pld[0].stu_en};
    assign v_m_stu_vld[0] = ((v_m_lsu_vld[0] && v_pld_ldu_en[0] && v_m_lsu_vld[1] && v_pld_stu_en[1]) || (v_m_lsu_vld[0] && v_pld_stu_en[0])) && stu_credit_can_use;
    assign v_m_stu_vld[1] = v_m_lsu_vld[0] && v_pld_stu_en[0] && v_m_lsu_vld[1] && v_pld_stu_en[1] && stu_credit_can_use;

    assign v_pld_ldu_en   = {v_m_pld[1].ldu_en,v_m_pld[0].ldu_en};
    assign v_m_ldu_vld[0] = ((v_m_lsu_vld[0] && v_pld_stu_en[0] && v_m_lsu_vld[1] && v_pld_ldu_en[1]) || (v_m_lsu_vld[0] && v_pld_ldu_en[0])) && ldu_credit_can_use;
    assign v_m_ldu_vld[1] = v_m_lsu_vld[0] && v_pld_ldu_en[0] && v_m_lsu_vld[1] && v_pld_ldu_en[1] && ldu_credit_can_use;

    assign v_m_stu_pld[1] = v_m_pld[1];
    assign v_m_ldu_pld[1] = v_m_pld[1];

    assign v_m_stu_pld[0] = (v_m_lsu_vld[0] && v_pld_stu_en[0]) ? v_m_pld[0] : v_m_pld[1];
    assign v_m_ldu_pld[0] = (v_m_lsu_vld[0] && v_pld_ldu_en[0]) ? v_m_pld[0] : v_m_pld[1];

    always_comb begin   
        v_m_pld[0]      = v_pld_mem[rd_ptr[LSU_DEPTH_WIDTH-1:0]];
        v_m_pld[0].lsid = 1'b0;
        if(v_forward_rs1_en_reg[rd_ptr[LSU_DEPTH_WIDTH-1:0]])begin
            v_m_pld[0].reg_rs1_val = v_forward_data[v_pld_mem[rd_ptr[LSU_DEPTH_WIDTH-1:0]].rs1_forward_id];
        end
        if(v_forward_rs2_en_reg[rd_ptr[LSU_DEPTH_WIDTH-1:0]])begin
            v_m_pld[0].reg_rs2_val = v_forward_data[v_pld_mem[rd_ptr[LSU_DEPTH_WIDTH-1:0]].rs2_forward_id];
        end
    end
    always_comb begin   
        v_m_pld[1]      = v_pld_mem[DEPTH_WIDTH'(rd_ptr[LSU_DEPTH_WIDTH-1:0]+1)];
        v_m_pld[1].lsid = 1'b1;
        if(v_forward_rs1_en_reg[DEPTH_WIDTH'(rd_ptr[LSU_DEPTH_WIDTH-1:0]+1)])begin
            v_m_pld[1].reg_rs1_val = v_forward_data[v_pld_mem[DEPTH_WIDTH'(rd_ptr[LSU_DEPTH_WIDTH-1:0]+1)].rs1_forward_id];
        end
        if(v_forward_rs2_en_reg[DEPTH_WIDTH'(rd_ptr[LSU_DEPTH_WIDTH-1:0]+1)])begin
            v_m_pld[1].reg_rs2_val = v_forward_data[v_pld_mem[DEPTH_WIDTH'(rd_ptr[LSU_DEPTH_WIDTH-1:0]+1)].rs2_forward_id];
        end
    end

    //==============================
    // mem control
    //==============================

    assign v_pld_wr_en = vv_pld_wr_en[0] | vv_pld_wr_en[1] | vv_pld_wr_en[2] | vv_pld_wr_en[3];
    assign v_forward_rs1_en = vv_forward_rs1_en[0] | vv_forward_rs1_en[1] | vv_forward_rs1_en[2] | vv_forward_rs1_en[3];
    assign v_forward_rs2_en = vv_forward_rs2_en[0] | vv_forward_rs2_en[1] | vv_forward_rs2_en[2] | vv_forward_rs2_en[3];
    generate
        for(genvar j=0;j<DEPTH;j=j+1)begin
            for(i=0;i<S_CHANNEL;i=i+1)begin
                assign vv_pld_wr_en[i][j] = (j==v_s_lsu_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]) && v_wr_en[i];
                assign vv_forward_rs1_en[i][j] = (j==v_s_lsu_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]) && v_wr_en[i] && v_s_lsu_pld[i].rs1_forward_cycle[1];
                assign vv_forward_rs2_en[i][j] = (j==v_s_lsu_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]) && v_wr_en[i] && v_s_lsu_pld[i].rs2_forward_cycle[1];
            end
            assign v_wr_pld[j] =    vv_pld_wr_en[3][j] ? v_s_lsu_pld[3]:
                                    vv_pld_wr_en[2][j] ? v_s_lsu_pld[2]:
                                    vv_pld_wr_en[1][j] ? v_s_lsu_pld[1]:
                                    v_s_lsu_pld[0];


        end
    // mem ----------------------------------------------------
        for (i=0;i<DEPTH;i=i+1)begin
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_pld_en[i] <= 1'b0;
                end
                else if(cancel_en)begin
                    v_pld_en[i] <= 1'b0;
                end
                else if (v_pld_wr_en[i])  begin
                    v_pld_en[i] <= 1'b1;
                end
                else if ( |v_rd_en && ((i>=rd_ptr[LSU_DEPTH_WIDTH-1:0]) && (i<rd_ptr_nxt[LSU_DEPTH_WIDTH-1:0])) ||  (rd_ptr_over && ((i>=rd_ptr[LSU_DEPTH_WIDTH-1:0]) || (i+DEPTH)<{rd_ptr_over,rd_ptr_nxt[LSU_DEPTH_WIDTH-1:0]})) )  begin
                    v_pld_en[i] <= 1'b0;
                end
            end

            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_forward_rs1_en_reg[i] <= 1'b0;
                end
                else if(cancel_en)begin
                    v_forward_rs1_en_reg[i] <= 1'b0;
                end
                else if (v_forward_rs1_en[i])  begin
                    v_forward_rs1_en_reg[i] <= 1'b1;
                end
                else if (v_forward_rs1_en_reg[i])  begin
                    v_forward_rs1_en_reg[i] <= 1'b0;
                end
            end

            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_forward_rs2_en_reg[i] <= 1'b0;
                end
                else if(cancel_en)begin
                    v_forward_rs2_en_reg[i] <= 1'b0;
                end
                else if (v_forward_rs2_en[i])  begin
                    v_forward_rs2_en_reg[i] <= 1'b1;
                end
                else if (v_forward_rs2_en_reg[i])  begin
                    v_forward_rs2_en_reg[i] <= 1'b0;
                end
            end

            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    v_pld_mem[i] <= {$bits(lsu_pkg){1'b0}};
                end
                else if(v_pld_wr_en[i])  begin
                    v_pld_mem[i] <= v_wr_pld[i];
                end
                else if(v_forward_rs1_en_reg[i] && v_forward_rs2_en_reg[i])begin
                    v_pld_mem[i].reg_rs1_val <= v_forward_data[v_pld_mem[i].rs1_forward_id];
                    v_pld_mem[i].reg_rs2_val <= v_forward_data[v_pld_mem[i].rs2_forward_id];
                end
                else if(v_forward_rs1_en_reg[i])begin
                    v_pld_mem[i].reg_rs1_val <= v_forward_data[v_pld_mem[i].rs1_forward_id];
                end
                else if(v_forward_rs2_en_reg[i])begin
                    v_pld_mem[i].reg_rs2_val <= v_forward_data[v_pld_mem[i].rs2_forward_id];
                end
            end
        end
    endgenerate














endmodule