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
    input  eu_pkg                               v_s_lsu_pld [S_CHANNEL-1    :0] ,
    input  logic [S_CHANNEL-1       :0]         v_s_lsu_stu_en                  ,
    output stq_commit_pkg                       stq_commit_pld                  ,
    output logic [$clog2(DEPTH)     :0]         lsu_buffer_rd_ptr               ,
    input  logic [REG_WIDTH-1       :0]         v_forward_data                  [EU_NUM-1           :0],

    output logic                                m_vld                           ,
    input  logic                                m_rdy                           ,
    output eu_pkg                               m_pld                           ,
    output logic                                m_stu_en                        , //***

    input  logic [$clog2(STU_DEPTH)-1    :0]    stq_wr_ptr                      ,
    input  logic                                cancel_en                       ,

    input  logic                                stu_credit_en                   ,
    input  logic  [3                 :0]        stu_credit_num                  ,
    input  logic  [$clog2(STU_DEPTH)-1:0]       stq_commit_cnt                  
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
    logic                               commit_error                ;
    logic                               taken                       ;
    logic                               stu_vld                     ;
    logic                               stu_credit_can_use          ;
    logic [S_CHANNEL-1          :0]     v_wr_en                     ;
    logic                               rd_en                       ;
    logic [$clog2(DEPTH)        :0]     rd_ptr                      ;
    logic [$clog2(DEPTH)        :0]     rd_ptr_nxt                  ;

    logic [DEPTH-1              :0]     v_forward_rs1_en_reg        ;
    logic [DEPTH-1              :0]     v_forward_rs2_en_reg        ;
    logic [DEPTH-1              :0]     v_pld_en                    ;
    logic [$clog2(STU_DEPTH)    :0]     stu_credit_cnt              ;
    logic [3                    :0]     stu_add                     ;
    logic [ADDR_WIDTH-1         :0]     real_nxt_pc                 ; 
    logic [ADDR_WIDTH-1         :0]     full_offset                 ;

    eu_pkg                              v_pld_mem   [DEPTH-1        :0] ;
    eu_pkg                              v_wr_pld    [DEPTH-1        :0] ;
    logic [DEPTH-1              :0]     v_pld_stu_en                    ;
    logic [DEPTH-1              :0]     v_stu_en                        ;
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

    assign rd_en =   m_vld & m_rdy;

    assign lsu_buffer_rd_ptr = rd_ptr;

    //==============================
    // credit
    //==============================

    assign stu_add = stu_credit_en ? stu_credit_num : 0 ;
    assign stu_en = m_rdy & stu_vld;
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            stu_credit_cnt <= STU_DEPTH;
        end
        else if(cancel_en)begin
            stu_credit_cnt <= STU_DEPTH - stq_commit_cnt;
        end
        else if(rd_en || stu_credit_en)begin
            stu_credit_cnt <= stu_credit_cnt + stu_add - stu_en;
        end
    end
    assign stu_credit_can_use = (stu_credit_cnt>0);

    //==============================
    // rd ptr
    //==============================

    assign rd_ptr_nxt = rd_ptr + rd_en;
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

    assign m_vld = v_pld_en[rd_ptr[LSU_DEPTH_WIDTH-1:0]] && stu_credit_can_use;
    assign m_stu_en =  v_pld_stu_en[rd_ptr[LSU_DEPTH_WIDTH-1:0]]; //***
    assign stu_vld  = m_vld && m_stu_en; //***

    always_comb begin   
        m_pld      = v_pld_mem[rd_ptr[LSU_DEPTH_WIDTH-1:0]];
        if(v_forward_rs1_en_reg[rd_ptr[LSU_DEPTH_WIDTH-1:0]])begin
            m_pld.reg_rs1_val = v_forward_data[v_pld_mem[rd_ptr[LSU_DEPTH_WIDTH-1:0]].fwd_pld.rs1_forward_id];
        end
        if(v_forward_rs2_en_reg[rd_ptr[LSU_DEPTH_WIDTH-1:0]])begin
            m_pld.reg_rs2_val = v_forward_data[v_pld_mem[rd_ptr[LSU_DEPTH_WIDTH-1:0]].fwd_pld.rs2_forward_id];
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
                assign vv_forward_rs1_en[i][j] = (j==v_s_lsu_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]) && v_wr_en[i] && v_s_lsu_pld[i].fwd_pld.rs1_forward_cycle[1];
                assign vv_forward_rs2_en[i][j] = (j==v_s_lsu_pld[i].lsu_id[LSU_DEPTH_WIDTH-1:0]) && v_wr_en[i] && v_s_lsu_pld[i].fwd_pld.rs2_forward_cycle[1];
            end
            assign v_wr_pld[j] =    vv_pld_wr_en[3][j] ? v_s_lsu_pld[3]:
                                    vv_pld_wr_en[2][j] ? v_s_lsu_pld[2]:
                                    vv_pld_wr_en[1][j] ? v_s_lsu_pld[1]:
                                    v_s_lsu_pld[0];
            assign v_stu_en[j] =    vv_pld_wr_en[3][j] ? v_s_lsu_stu_en[3]:
                                    vv_pld_wr_en[2][j] ? v_s_lsu_stu_en[2]:
                                    vv_pld_wr_en[1][j] ? v_s_lsu_stu_en[1]:
                                    v_s_lsu_stu_en[0];  //***

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
                else if ( rd_en && (i==rd_ptr[LSU_DEPTH_WIDTH-1:0]) )  begin
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
                    v_pld_mem[i] <= {$bits(eu_pkg){1'b0}};
                end
                else if(v_pld_wr_en[i])  begin
                    v_pld_mem[i] <= v_wr_pld[i];
                end
                else if(v_forward_rs1_en_reg[i] && v_forward_rs2_en_reg[i])begin
                    v_pld_mem[i].reg_rs1_val <= v_forward_data[v_pld_mem[i].fwd_pld.rs1_forward_id];
                    v_pld_mem[i].reg_rs2_val <= v_forward_data[v_pld_mem[i].fwd_pld.rs2_forward_id];
                end
                else if(v_forward_rs1_en_reg[i])begin
                    v_pld_mem[i].reg_rs1_val <= v_forward_data[v_pld_mem[i].fwd_pld.rs1_forward_id];
                end
                else if(v_forward_rs2_en_reg[i])begin
                    v_pld_mem[i].reg_rs2_val <= v_forward_data[v_pld_mem[i].fwd_pld.rs2_forward_id];
                end
            end

            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    v_pld_stu_en[i] <= {1'b0};
                end
                else if(v_pld_wr_en[i])  begin
                    v_pld_stu_en[i] <= v_stu_en[i];
                end
            end //***
        end
    endgenerate
    

 always_ff @(posedge clk) begin
        if(rd_en) begin 
            stq_commit_pld.stq_commit_entry_en  <= v_s_lsu_stu_en                           ;
            stq_commit_pld.stq_commit_entry     <= stq_wr_ptr                               ;
        end
    end


endmodule
