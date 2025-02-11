module toy_stq 
    import toy_pack::*;
(
    input  logic                             clk                        ,
    input  logic                             rst_n                      ,

    input  logic                             store_en                   ,
    input  agu_pkg                           store_pld                  ,

    output logic [STU_DEPTH-1           :0]  v_stq_en                   ,
    output agu_pkg                           v_stq_pld  [STU_DEPTH-1 :0], 
    // input  logic                             hazard_flag                ,

    output logic                             stq_credit_en              ,
    output logic [3                     :0]  stq_credit_num             ,     
    output logic [$clog2(STU_DEPTH)-1   :0]  stq_commit_cnt             ,

    output agu_pkg                           s_mem_req_pld              ,
    output logic                             s_mem_req_vld              ,
    input  logic                             s_mem_req_rdy              ,

    output logic [$clog2(STU_DEPTH)-1    :0] stq_wr_ptr                 ,

    output logic                             stq_commit_en              ,
    output logic [INST_IDX_WIDTH-1       :0] stq_commit_id              ,

    input  logic                             cancel_en                  ,
    input  logic [3                     :0]  v_st_ack_commit_en         ,
    input  logic [$clog2(STU_DEPTH)-1   :0]  v_st_ack_commit_entry [3:0]   


);

    localparam integer unsigned DEPTH_WIDTH = $clog2(STU_DEPTH);

    agu_pkg                     v_entry_pld   [STU_DEPTH-1:0]  ;

    logic                       rd_en                   ;

    logic [DEPTH_WIDTH-1    :0] rd_ptr                  ;
    logic                       wr_en                   ;
    logic [STU_DEPTH-1      :0] v_entry_en              ;
    logic [STU_DEPTH-1      :0] v_entry_commit          ;

    logic [DEPTH_WIDTH-1    :0] wr_ptr_commit           ;
    logic [DEPTH_WIDTH-1    :0] wr_ptr_commit_add       ;
    logic [DEPTH_WIDTH-1    :0] stq_commit_add          ;
    //========================
    // ld hazard
    //========================
    assign v_stq_en  = v_entry_en;
    assign v_stq_pld = v_entry_pld;

    //======================
    // wr ptr
    //======================
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            stq_wr_ptr <= {DEPTH_WIDTH{1'b0}};
        end
        else if(cancel_en)begin
            stq_wr_ptr <= wr_ptr_commit;
        end
        else if(store_en)begin
            stq_wr_ptr <= stq_wr_ptr + 1'b1;
        end
    end

    assign  wr_ptr_commit_add = v_st_ack_commit_en[0] + v_st_ack_commit_en[1] + v_st_ack_commit_en[2] + v_st_ack_commit_en[3];
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            wr_ptr_commit <= {DEPTH_WIDTH{1'b0}};
        end
        else if(|v_st_ack_commit_en)begin
            wr_ptr_commit <= wr_ptr_commit + wr_ptr_commit_add ;
        end
    end

    assign stq_commit_add = wr_ptr_commit_add - rd_en;
    always_ff @(posedge clk or negedge rst_n) begin 
        if(~rst_n)begin
            stq_commit_cnt <= {DEPTH_WIDTH{1'b0}};
        end
        else if(|v_st_ack_commit_en | rd_en)begin
            stq_commit_cnt <= stq_commit_cnt + stq_commit_add;
        end
        
    end

    //======================
    // rd ptr
    //======================
    assign rd_en = s_mem_req_vld && s_mem_req_rdy;
    always_ff @(posedge clk or negedge rst_n) begin 
        if(~rst_n)begin
            rd_ptr <= {DEPTH_WIDTH{1'b0}};
        end
        else if(rd_en)begin
            rd_ptr <= rd_ptr + 1'b1 ;
        end
    end

    assign s_mem_req_vld = v_entry_commit[rd_ptr];
    assign s_mem_req_pld.mem_req_opcode   = TOY_BUS_WRITE;
    assign s_mem_req_pld.mem_req_data     = v_entry_pld[rd_ptr].mem_req_data    ;
    assign s_mem_req_pld.mem_req_strb     = v_entry_pld[rd_ptr].mem_req_strb    ;
    assign s_mem_req_pld.mem_req_addr     = v_entry_pld[rd_ptr].mem_req_addr    ;
    assign s_mem_req_pld.mem_req_sideband = v_entry_pld[rd_ptr].mem_req_sideband;
    //======================
    //stq_credit
    //======================

    assign stq_credit_en = rd_en;
    assign stq_credit_num = 4'd1;

    //======================
    // commit
    //======================

    // assign stq_commit_en = wr_en;
    // assign stq_commit_id = store_pld.mem_req_sideband[16:11];
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            stq_commit_en <= 0;
        end
        else begin
            stq_commit_en <= wr_en;
        end
    end

    always_ff @(posedge clk) begin
        if(wr_en) begin
            stq_commit_id <= store_pld.mem_req_sideband[16:11];
        end
    end

    //======================
    // commit ack
    //======================
    logic [STU_DEPTH-1:0] vv_commit_en [COMMIT_REL_CHANNEL-1:0];
    logic [STU_DEPTH-1:0] v_commit_en ;
    generate
        for(genvar i=0;i<4;i=i+1)begin
            always_comb begin
                vv_commit_en[i] = {STU_DEPTH{1'b0}};
                vv_commit_en[i][v_st_ack_commit_entry[i]] = v_st_ack_commit_en[i];

            end
        end
    endgenerate

    assign v_commit_en = vv_commit_en[0] | vv_commit_en[1] | vv_commit_en[2] | vv_commit_en[3];


    //======================
    // mem
    //======================

    // assign wr_en = store_en && ~hazard_flag;
    assign wr_en = store_en ;
    generate
        for(genvar i=0;i<STU_DEPTH;i=i+1)begin
            always_ff @(posedge clk or negedge rst_n) begin 
                if(~rst_n)begin
                    v_entry_pld[i] <= {$bits(agu_pkg){1'b0}};
                end
                else if((wr_en)&&(i==stq_wr_ptr))begin
                    v_entry_pld[i].mem_req_sideband <= {stq_wr_ptr,store_pld.mem_req_sideband[16:0]};
                    v_entry_pld[i].mem_req_addr     <= store_pld.mem_req_addr;
                    v_entry_pld[i].mem_req_strb     <= store_pld.mem_req_strb;
                    v_entry_pld[i].mem_req_data     <= store_pld.mem_req_data;
                    v_entry_pld[i].mem_req_opcode   <= TOY_BUS_WRITE;
                end

            end

            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_entry_en[i] <= 1'b0;
                end
                else if( (cancel_en & ~v_entry_commit[i]))begin
                    v_entry_en[i] <= 1'b0;
                end
                else if( (wr_en)&&(i==stq_wr_ptr) ) begin
                    v_entry_en[i] <= 1'b1;
                end
                else if(rd_en && (i==rd_ptr))begin
                    v_entry_en[i] <= 1'b0;
                end
            end


            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_entry_commit[i] <= 1'b0;
                end
                else if(v_commit_en[i]==1'b1) begin
                    v_entry_commit[i] <= 1'b1;
                end
                else if(rd_en && (i==rd_ptr))begin
                    v_entry_commit[i] <= 1'b0;
                end
            end


        end
    endgenerate












endmodule

