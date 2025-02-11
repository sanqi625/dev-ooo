module toy_lsu_hazard
    import toy_pack::*;
(
    input  logic                             clk                        ,
    input  logic                             rst_n                      ,

    input  logic                             cancel_en                  ,
    input  logic                             ld_hazard_en               ,
    input  agu_pkg                           ld_hazard_pld              ,

    input  logic [STU_DEPTH-1           :0]  v_stq_en                   ,
    input  agu_pkg                           v_stq_pld  [STU_DEPTH-1 :0], 
    output logic                             hazard_flag                ,
    input  logic [$clog2(STU_DEPTH)-1    :0] stq_wr_ptr                 ,

    output logic                             cancel_noack_en            ,
    output logic                             cancel_ack_en              ,
    output mem_ack_pkg                       cancel_ack_pld             ,

    output agu_pkg                           s_mem_req_pld              ,
    output logic                             s_mem_req_vld              ,
    input  logic                             s_mem_req_rdy               


);
    //##############################################
    // logic 
    //############################################## 
    localparam integer unsigned DEPTH_WIDTH = $clog2(STU_DEPTH);
    logic                       hazard_flag_reg         ;
    logic                       re_req_comb             ;
    logic                       re_req_reg              ;
    logic [1                :0] v_ld_en                 ;
    logic [STU_DEPTH-1      :0] mask_en                 ;
    
    logic [STU_DEPTH-1      :0] v_hazard_check  [1:0]   ;
    logic [STU_DEPTH-1      :0] same_addr_en            ;
    logic [STU_DEPTH-1      :0] hazard_en               ;
    logic [DEPTH_WIDTH-1    :0] same_addr_index         ;
    logic [DEPTH_WIDTH-1    :0] v_ld_bin        [1:0]   ;
    logic                       hazard_flag_comb        ;
    agu_pkg                     ld_hazard_pld_reg       ;
    logic                       ld_hazard_en_reg        ;
    logic [3                :0] v_hazard_strb [STU_DEPTH-1:0];
    //========================
    // ld hazard
    //========================
    assign s_mem_req_vld = re_req_comb | re_req_reg;
    assign hazard_flag = hazard_flag_comb | re_req_reg;

    assign re_req_comb = hazard_flag_reg & ~hazard_flag_comb;

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            re_req_reg <= 0;
        end
        else if(cancel_en)begin
            re_req_reg <= 0;
        end
        else if(s_mem_req_vld & s_mem_req_rdy)begin
            re_req_reg <= 0;
        end        
        else if(s_mem_req_vld & ~s_mem_req_rdy)begin
            re_req_reg <= 1;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            hazard_flag_reg <= 0;
        end
        else if(cancel_en)begin
            hazard_flag_reg <= 0;
        end
        else begin
            hazard_flag_reg <= hazard_flag_comb;
        end        
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            ld_hazard_en_reg <= 0;
        end
        else if(cancel_en)begin
            ld_hazard_en_reg <= 0;
        end
        else begin
            ld_hazard_en_reg <= ld_hazard_en | hazard_flag_comb;
        end        
    end
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            ld_hazard_pld_reg <= {$bits(agu_pkg){1'b0}};
        end
        else if(ld_hazard_en)begin
            ld_hazard_pld_reg <= ld_hazard_pld;
        end        
    end
    //hazard check first
    assign v_hazard_check[0] = hazard_en & mask_en;
    //hazard check second
    assign v_hazard_check[1] = hazard_en & (~mask_en);
    
    assign same_addr_en      = v_ld_en[0] | v_ld_en[1];
    assign same_addr_index   = v_ld_en[0] ? v_ld_bin[0] : v_ld_bin[1];

    generate
        for(genvar j=0;j<2;j=j+1)begin
            cmn_lead_one_msb #(
                .ENTRY_NUM      (STU_DEPTH              )
            ) u_hazard_ldone(
                .v_entry_vld    (v_hazard_check[j]      ),
                .v_free_idx_oh  (                       ),
                .v_free_idx_bin (v_ld_bin[j]            ),
                .v_free_vld     (v_ld_en[j]             )
            );
        end

        for(genvar i=0;i<STU_DEPTH;i=i+1)begin
            assign v_hazard_strb[i] = ld_hazard_en_reg && v_stq_en[i] && (v_stq_pld[i].mem_req_strb != ld_hazard_pld_reg.mem_req_strb);
            assign hazard_en[i] = ld_hazard_en_reg && v_stq_en[i] && (v_stq_pld[i].mem_req_addr == ld_hazard_pld_reg.mem_req_addr);
            assign mask_en[i] = (i<=(DEPTH_WIDTH'(stq_wr_ptr-1)));
        end
    endgenerate

    always_comb begin
        hazard_flag_comb          = 1'b0;
        cancel_noack_en           = 1'b0;
        cancel_ack_en             = 1'b0;
        if(ld_hazard_en_reg && same_addr_en)begin
            if(v_hazard_strb[same_addr_index])begin
                hazard_flag_comb = 1'b1;
                cancel_noack_en = 1'b1;
            end
            else begin
                cancel_ack_en = 1'b1;
            end
        end
    end


    assign cancel_ack_pld.mem_ack_data      = DATA_WIDTH'(v_stq_pld[same_addr_index].mem_req_data);
    assign cancel_ack_pld.mem_ack_sideband  = ld_hazard_pld_reg.mem_req_sideband;


    assign s_mem_req_pld.mem_req_addr       = ld_hazard_pld_reg.mem_req_addr;
    assign s_mem_req_pld.mem_req_sideband   = ld_hazard_pld_reg.mem_req_sideband;
    assign s_mem_req_pld.mem_req_opcode     = TOY_BUS_READ;
    assign s_mem_req_pld.mem_req_strb       = ld_hazard_pld_reg.mem_req_strb;




endmodule

