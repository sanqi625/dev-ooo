module toy_issue_buffer 
    import toy_pack::*;
(
    input  logic                                clk                             ,
    input  logic                                rst_n                           ,

    input  logic [4-1               :0]         v_s_vld                         ,
    output logic [4-1               :0]         v_s_rdy                         ,
    input  rename_pkg                           v_s_pld [4-1            :0]     ,

    output logic [4-1               :0]         v_m_vld                         ,
    input  logic [4-1               :0]         v_m_rdy                         ,
    output rename_pkg                           v_m_pld [4-1            :0]     ,

    input logic                                 cancel_edge_en                       
);
    
    //==============================
    // parameter
    //==============================
    localparam BUFFER_DEPTH         = 16                                        ;        
    localparam M_CHANNEL            = 4;
    localparam S_CHANNEL            = 4;
    localparam DEPTH_WIDTH          = $clog2(BUFFER_DEPTH)                      ;
    localparam S_CH_DEPTH_WIDTH     = $clog2(S_CHANNEL)                         ;
    localparam M_CHANNEL_WIDTH      = $clog2(M_CHANNEL)                         ;
    localparam M_CHANNEL_WIDTH_MUL2 = $clog2(M_CHANNEL*2)                       ;

    //============================== 
    // logic
    //==============================

    logic [DEPTH_WIDTH              :0] wr_ptr                          ; //v_wr_ptr_add[0]
    logic [DEPTH_WIDTH              :0] wr_ptr_nxt                      ;
    logic [DEPTH_WIDTH              :0] v_wr_ptr_add          [4:0]     ;
    logic [DEPTH_WIDTH              :0] rd_ptr                          ; //v_rd_ptr_add[0]
    logic [DEPTH_WIDTH              :0] rd_ptr_nxt                      ;
    logic [DEPTH_WIDTH              :0] v_rd_ptr_add          [4:0]     ;
    logic [DEPTH_WIDTH              :0] end_ptr                         ; 
    logic [DEPTH_WIDTH              :0] end_ptr_nxt                     ; //no use
    logic [DEPTH_WIDTH              :0] v_end_ptr_add         [4:0]     ;

    logic [DEPTH_WIDTH-1            :0] v_rd_index            [3:0]     ;
    logic [3                        :0] v_wr_index_en                   ;
    logic [DEPTH_WIDTH-1            :0] v_wr_index            [3:0]     ;
    logic [DEPTH_WIDTH-1            :0] v_out_index           [3:0]     ;
    logic [DEPTH_WIDTH-1            :0] v_out_index_nxt       [3:0]     ;

    logic [BUFFER_DEPTH-1           :0] v_mem_en                        ;
    logic [4-1                      :0] v_m_en                          ;
    logic [4-1                      :0] v_s_en                          ;
    logic [DEPTH_WIDTH-1            :0] v_fifo_pld   [BUFFER_DEPTH-1:0] ;

    logic [BUFFER_DEPTH-1           :0] v_mem_wr_en                     ;
    logic [BUFFER_DEPTH-1           :0] v_mem_rd_en                     ;
    logic [M_CHANNEL-1              :0] v_mem_en_add                    ;
    logic [M_CHANNEL-1              :0] v_mem_en_nxt                    ;
    logic [M_CHANNEL-1              :0] v_mem_en_comb                   ;
    logic [BUFFER_DEPTH-1           :0] vv_mem_wr_en    [S_CHANNEL-1:0] ;
    logic [BUFFER_DEPTH-1           :0] vv_mem_rd_en    [M_CHANNEL-1:0] ;

    rename_pkg                          v_mem_pld    [BUFFER_DEPTH-1:0] ;
    rename_pkg                          v_mem_wr_pld [BUFFER_DEPTH-1:0] ;
    rename_pkg                          v_mem_pld_add   [M_CHANNEL-1:0] ;
    rename_pkg                          v_mem_pld_nxt   [M_CHANNEL-1:0] ;
    rename_pkg                          v_mem_pld_comb  [M_CHANNEL-1:0] ;

    assign v_m_en = v_m_vld & v_m_rdy;
    assign v_s_en = v_s_vld & v_s_rdy;
    //============================== 
    // output index gen
    //==============================
    always_comb begin 
        case (v_m_en)
            4'b0000: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[1]    ;
                v_out_index_nxt[2]   = v_out_index[2]    ;
                v_out_index_nxt[3]   = v_out_index[3]    ;
                v_mem_en_nxt         = v_mem_en_comb     ;
                v_mem_pld_nxt        = v_mem_pld_comb    ;
            end
            4'b0001: begin
                v_out_index_nxt[0]   = v_out_index[1]    ;
                v_out_index_nxt[1]   = v_out_index[2]    ;
                v_out_index_nxt[2]   = v_out_index[3]    ;
                v_out_index_nxt[3]   = v_rd_index[0]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[2]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[3]      = v_mem_en_add[0]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[2]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[0]  ;
            end
            4'b0010: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[2]    ;
                v_out_index_nxt[2]   = v_out_index[3]    ;
                v_out_index_nxt[3]   = v_rd_index[0]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[2]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[3]      = v_mem_en_add[0]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[2]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[0]  ;

            end
            4'b0011: begin
                v_out_index_nxt[0]   = v_out_index[2]    ;
                v_out_index_nxt[1]   = v_out_index[3]    ;
                v_out_index_nxt[2]   = v_rd_index[0]     ;
                v_out_index_nxt[3]   = v_rd_index[1]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[2]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[1]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[1]  ;

            end
            4'b0100: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[1]    ;
                v_out_index_nxt[2]   = v_out_index[3]    ;
                v_out_index_nxt[3]   = v_rd_index[0]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[2]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[3]      = v_mem_en_add[0]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[2]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[0]  ;

            end
            4'b0101: begin
                v_out_index_nxt[0]   = v_out_index[1]    ;
                v_out_index_nxt[1]   = v_out_index[3]    ;
                v_out_index_nxt[2]   = v_rd_index[0]     ;
                v_out_index_nxt[3]   = v_rd_index[1]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[2]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[1]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[1]  ;

            end
            4'b0110: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[3]    ;
                v_out_index_nxt[2]   = v_rd_index[0]     ;
                v_out_index_nxt[3]   = v_rd_index[1]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[2]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[1]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[1]  ;

            end
            4'b0111: begin
                v_out_index_nxt[0]   = v_out_index[3]    ;
                v_out_index_nxt[1]   = v_rd_index[0]     ;
                v_out_index_nxt[2]   = v_rd_index[1]     ;
                v_out_index_nxt[3]   = v_rd_index[2]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[3]  ;
                v_mem_en_nxt[1]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[2]      = v_mem_en_add[1]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[2]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[3] ;
                v_mem_pld_nxt[1]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[1]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[2]  ;

            end
            4'b1000: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[1]    ;
                v_out_index_nxt[2]   = v_out_index[2]    ;
                v_out_index_nxt[3]   = v_rd_index[0]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[2]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[3]      = v_mem_en_add[0]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[2]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[0]  ;

            end
            4'b1001: begin
                v_out_index_nxt[0]   = v_out_index[1]    ;
                v_out_index_nxt[1]   = v_out_index[2]    ;
                v_out_index_nxt[2]   = v_rd_index[0]     ;
                v_out_index_nxt[3]   = v_rd_index[1]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[2]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[1]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[1]  ;

            end
            4'b1010: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[2]    ;
                v_out_index_nxt[2]   = v_rd_index[0]     ;
                v_out_index_nxt[3]   = v_rd_index[1]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[2]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[1]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[1]  ;

            end
            4'b1011: begin
                v_out_index_nxt[0]   = v_out_index[2]    ;
                v_out_index_nxt[1]   = v_rd_index[0]     ;
                v_out_index_nxt[2]   = v_rd_index[1]     ;
                v_out_index_nxt[3]   = v_rd_index[2]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[2]  ;
                v_mem_en_nxt[1]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[2]      = v_mem_en_add[1]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[2]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[2] ;
                v_mem_pld_nxt[1]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[1]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[2]  ;

            end
            4'b1100: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_out_index[1]    ;
                v_out_index_nxt[2]   = v_rd_index[0]     ;
                v_out_index_nxt[3]   = v_rd_index[1]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[2]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[1]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[1]  ;

            end
            4'b1101: begin
                v_out_index_nxt[0]   = v_out_index[1]    ;
                v_out_index_nxt[1]   = v_rd_index[0]     ;
                v_out_index_nxt[2]   = v_rd_index[1]     ;
                v_out_index_nxt[3]   = v_rd_index[2]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[1]  ;
                v_mem_en_nxt[1]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[2]      = v_mem_en_add[1]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[2]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[1] ;
                v_mem_pld_nxt[1]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[1]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[2]  ;

            end
            4'b1110: begin
                v_out_index_nxt[0]   = v_out_index[0]    ;
                v_out_index_nxt[1]   = v_rd_index[0]     ;
                v_out_index_nxt[2]   = v_rd_index[1]     ;
                v_out_index_nxt[3]   = v_rd_index[2]     ;
                v_mem_en_nxt[0]      = v_mem_en_comb[0]  ;
                v_mem_en_nxt[1]      = v_mem_en_add[0]   ;
                v_mem_en_nxt[2]      = v_mem_en_add[1]   ;
                v_mem_en_nxt[3]      = v_mem_en_add[2]   ;
                v_mem_pld_nxt[0]     = v_mem_pld_comb[0] ;
                v_mem_pld_nxt[1]     = v_mem_pld_add[0]  ;
                v_mem_pld_nxt[2]     = v_mem_pld_add[1]  ;
                v_mem_pld_nxt[3]     = v_mem_pld_add[2]  ;

            end
            4'b1111: begin
                v_out_index_nxt[0]   = v_rd_index[0]     ;
                v_out_index_nxt[1]   = v_rd_index[1]     ;
                v_out_index_nxt[2]   = v_rd_index[2]     ;
                v_out_index_nxt[3]   = v_rd_index[3]     ;
                v_mem_en_nxt         = v_mem_en_add      ;
                v_mem_pld_nxt        = v_mem_pld_add     ;
            end
        endcase
    end


    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            v_out_index[0]   <= 0;
            v_out_index[1]   <= 1;
            v_out_index[2]   <= 2;
            v_out_index[3]   <= 3;
        end
        else if(cancel_edge_en)begin
            v_out_index[0]   <= 0;
            v_out_index[1]   <= 1;
            v_out_index[2]   <= 2;
            v_out_index[3]   <= 3;
        end
        else begin
            v_out_index[0]   <= v_out_index_nxt[0]    ;
            v_out_index[1]   <= v_out_index_nxt[1]    ;
            v_out_index[2]   <= v_out_index_nxt[2]    ;
            v_out_index[3]   <= v_out_index_nxt[3]    ;

        end
    end
    //============================== 
    // fifo rd ptr nxt 
    //==============================
    always_comb begin
        case (v_m_en)
            4'b0000: begin
                rd_ptr_nxt = v_rd_ptr_add[0];
            end
            4'b0001: begin
                rd_ptr_nxt = v_rd_ptr_add[1];
            end
            4'b0010: begin
                rd_ptr_nxt = v_rd_ptr_add[1];
            end
            4'b0011: begin
                rd_ptr_nxt = v_rd_ptr_add[2];
            end
            4'b0100: begin
                rd_ptr_nxt = v_rd_ptr_add[1];
            end
            4'b0101: begin
                rd_ptr_nxt = v_rd_ptr_add[2];
            end
            4'b0110: begin
                rd_ptr_nxt = v_rd_ptr_add[2];
            end
            4'b0111: begin
                rd_ptr_nxt = v_rd_ptr_add[3];
            end
            4'b1000: begin
                rd_ptr_nxt = v_rd_ptr_add[1];
            end
            4'b1001: begin
                rd_ptr_nxt = v_rd_ptr_add[2];
            end
            4'b1010: begin
                rd_ptr_nxt = v_rd_ptr_add[2];
            end
            4'b1011: begin
                rd_ptr_nxt = v_rd_ptr_add[3];
            end
            4'b1100: begin
                rd_ptr_nxt = v_rd_ptr_add[2];
            end
            4'b1101: begin
                rd_ptr_nxt = v_rd_ptr_add[3];
            end
            4'b1110: begin
                rd_ptr_nxt = v_rd_ptr_add[3];
            end
            4'b1111: begin
                rd_ptr_nxt = v_rd_ptr_add[4];
            end
        endcase
    end
    //============================== 
    // rd logic 
    //==============================
    generate
        for(genvar i=0;i<M_CHANNEL+1;i=i+1)begin
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_rd_ptr_add[i] <= i+4;
                end
                else if(cancel_edge_en)begin
                    v_rd_ptr_add[i] <= i+4;
                end
                else begin
                    v_rd_ptr_add[i] <= rd_ptr_nxt + i;
                end
            end
            assign v_end_ptr_add[i] = end_ptr + i;
        end
        for(genvar i=0;i<M_CHANNEL;i=i+1)begin
            assign v_rd_index[i]        = v_fifo_pld[v_rd_ptr_add[i][DEPTH_WIDTH-1:0]];
            assign v_mem_pld_add[i]     = v_mem_pld[v_rd_index[i]];
            assign v_mem_pld_comb[i]    = v_mem_pld[v_out_index[i]];
            assign v_mem_en_add[i]      = v_mem_en[v_rd_index[i]];
            assign v_mem_en_comb[i]     = v_mem_en[v_out_index[i]];
            always_ff @( posedge clk or negedge rst_n ) begin
                if(~rst_n)begin
                    v_m_vld[i] <= 1'b0;
                end
                else if(cancel_edge_en)begin
                    v_m_vld[i] <= 1'b0;
                end
                else if(~|v_mem_en)begin
                    v_m_vld[i] <= v_s_vld[i];
                    v_m_pld[i] <= v_s_pld[i];
                end
                else begin
                    v_m_vld[i] <= v_mem_en_nxt[i];
                    v_m_pld[i] <= v_mem_pld_nxt[i];
                end
            end
        end

    endgenerate
    //============================== 
    // end ptr 
    //==============================


    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)begin
            end_ptr <= {1'b1,{DEPTH_WIDTH{1'b0}}};
            for(int i=0;i<BUFFER_DEPTH;i=i+1)begin
                v_fifo_pld[i] <= i;
            end
        end
        else if(cancel_edge_en)begin
            end_ptr <= {1'b1,{DEPTH_WIDTH{1'b0}}};
            for(int i=0;i<BUFFER_DEPTH;i=i+1)begin
                v_fifo_pld[i] <= i;
            end
        end
        else begin
            case (v_m_en)
                4'b0000: begin
                    end_ptr <= v_end_ptr_add[0];
                end
                4'b0001: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    end_ptr <= v_end_ptr_add[1];
                end
                4'b0010: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    end_ptr <= v_end_ptr_add[1];
                end
                4'b0011: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    end_ptr <= v_end_ptr_add[2];
                end
                4'b0100: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    end_ptr <= v_end_ptr_add[1];
                end
                4'b0101: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    end_ptr <= v_end_ptr_add[2];
                end
                4'b0110: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    end_ptr <= v_end_ptr_add[2];
                end
                4'b0111: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    v_fifo_pld[v_end_ptr_add[2][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    end_ptr <= v_end_ptr_add[3];
                end
                4'b1000: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[1];
                end
                4'b1001: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[2];
                end
                4'b1010: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[2];
                end
                4'b1011: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    v_fifo_pld[v_end_ptr_add[2][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[3];
                end
                4'b1100: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[2];
                end
                4'b1101: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    v_fifo_pld[v_end_ptr_add[2][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[3];
                end
                4'b1110: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    v_fifo_pld[v_end_ptr_add[2][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[3];
                end
                4'b1111: begin
                    v_fifo_pld[v_end_ptr_add[0][DEPTH_WIDTH-1:0]] <= v_out_index[0];
                    v_fifo_pld[v_end_ptr_add[1][DEPTH_WIDTH-1:0]] <= v_out_index[1];
                    v_fifo_pld[v_end_ptr_add[2][DEPTH_WIDTH-1:0]] <= v_out_index[2];
                    v_fifo_pld[v_end_ptr_add[3][DEPTH_WIDTH-1:0]] <= v_out_index[3];
                    end_ptr <= v_end_ptr_add[4];
                end
            endcase

        end
        
    end


    //============================== 
    // fifo wr ptr nxt 
    //==============================
    always_comb begin
        wr_ptr_nxt = v_wr_ptr_add[0];
        case (v_s_en)
            4'b0000: begin
                wr_ptr_nxt = v_wr_ptr_add[0];
            end
            4'b0001: begin
                wr_ptr_nxt = v_wr_ptr_add[1];
            end
            4'b0011: begin
                wr_ptr_nxt = v_wr_ptr_add[2];
            end
            4'b0111: begin
                wr_ptr_nxt = v_wr_ptr_add[3];
            end
            4'b1111: begin
                wr_ptr_nxt = v_wr_ptr_add[4];
            end
        endcase
    end
    //============================== 
    // wr logic 
    //==============================
    generate
        for(genvar i=0;i<S_CHANNEL+1;i=i+1)begin
            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_wr_ptr_add[i] <= i;
                end
                else if(cancel_edge_en)begin
                    v_wr_ptr_add[i] <= i;
                end
                else begin
                    v_wr_ptr_add[i] <= wr_ptr_nxt + i;
                end
            end
        end
        for(genvar i=0;i<S_CHANNEL;i=i+1)begin
            assign v_wr_index_en[i] = (v_wr_ptr_add[i][DEPTH_WIDTH] == end_ptr[DEPTH_WIDTH]) ?  (v_wr_ptr_add[i][DEPTH_WIDTH-1:0] <  end_ptr[DEPTH_WIDTH-1:0]) :
                                                                                                (v_wr_ptr_add[i][DEPTH_WIDTH-1:0] >= end_ptr[DEPTH_WIDTH-1:0]) ;
            assign v_wr_index[i] = v_fifo_pld[v_wr_ptr_add[i][DEPTH_WIDTH-1:0]];
        end

    endgenerate

    assign v_s_rdy = v_wr_index_en;

    assign v_mem_wr_en = vv_mem_wr_en[0] | vv_mem_wr_en[1] | vv_mem_wr_en[2] | vv_mem_wr_en[3];
    assign v_mem_rd_en = vv_mem_rd_en[0] | vv_mem_rd_en[1] | vv_mem_rd_en[2] | vv_mem_rd_en[3];
    generate
        for(genvar i=0;i<BUFFER_DEPTH;i=i+1)begin
            for(genvar j=0;j<S_CHANNEL;j=j+1)begin
                assign vv_mem_wr_en[j][i] = (i==v_wr_index[j]) && v_s_en[j];
            end
            for(genvar j=0;j<M_CHANNEL;j=j+1)begin
                assign vv_mem_rd_en[j][i] = (i==v_out_index[j]) && v_m_en[j];
            end

            assign v_mem_wr_pld[i] =    vv_mem_wr_en[3][i] ? v_s_pld[3]:
                                        vv_mem_wr_en[2][i] ? v_s_pld[2]:
                                        vv_mem_wr_en[1][i] ? v_s_pld[1]:v_s_pld[0];

            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_mem_pld[i] <= {$bits(rename_pkg){1'b0}};
                end
                else if(v_mem_wr_en[i])begin
                    v_mem_pld[i] <= v_mem_wr_pld[i];
                end
            end

            always_ff @(posedge clk or negedge rst_n) begin
                if(~rst_n)begin
                    v_mem_en[i] <= 1'b0;
                end
                else if(cancel_edge_en)begin
                    v_mem_en[i] <= 1'b0;
                end
                else if(v_mem_wr_en[i])begin
                    v_mem_en[i] <= 1'b1;
                end
                else if(v_mem_rd_en[i]) begin
                    v_mem_en[i] <= 1'b0;
                end
            end

        end

    endgenerate






    // `ifdef TOY_SIM
    // logic [63:0] cycle;


    // always_ff @(posedge clk or negedge rst_n) begin
    //     if(~rst_n)  cycle <= 0;
    //     else        cycle <= cycle + 1;
    // end



    // initial begin
    //     int     fhandle ;
    //     fhandle = $fopen("issue.log", "w");
    //     forever begin
    //         @(posedge clk)
    //             // $fdisplay(fhandle, "[cycle=%0d][in_en=%h][out_en=%h]", cycle,v_s_en,v_m_en);
    //             $fdisplay(fhandle, "[cycle=%0d][out_en=%h]", cycle,v_m_en);
    //             // if(v_s_en[0])begin
    //             //     $fdisplay(fhandle, "[in_0=%h]", v_s_pld[0].inst_pc);
    //             // end

    //             // if(v_s_en[1])begin
    //             //     $fdisplay(fhandle, "[in_1=%h]", v_s_pld[1].inst_pc);
    //             // end

    //             // if(v_s_en[2])begin
    //             //     $fdisplay(fhandle, "[in_2=%h]", v_s_pld[2].inst_pc);
    //             // end

    //             // if(v_s_en[3])begin
    //             //     $fdisplay(fhandle, "[in_3=%h]", v_s_pld[3].inst_pc);
    //             // end

    //             if(v_m_en[0])begin
    //                 $fdisplay(fhandle, "[o_0=%h]", v_m_pld[0].inst_pc);
    //             end

    //             if(v_m_en[1])begin
    //                 $fdisplay(fhandle, "[o_1=%h]", v_m_pld[1].inst_pc);
    //             end

    //             if(v_m_en[2])begin
    //                 $fdisplay(fhandle, "[o_2=%h]", v_m_pld[2].inst_pc);
    //             end

    //             if(v_m_en[3])begin
    //                 $fdisplay(fhandle, "[o_3=%h]", v_m_pld[3].inst_pc);
    //             end

    //     end
    // end

    // `endif
endmodule