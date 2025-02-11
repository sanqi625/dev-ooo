module toy_bpu_rob_entry
    import toy_pack::*;
    (
        input  logic                        clk,
        input  logic                        rst_n,

        input  logic                        icache_prealloc,
        input  logic                        icache_ack_vld,
        input  logic [FETCH_DATA_WIDTH-1:0] icache_ack_pld,
        
        input  logic                        bpdec_bp2_vld,
        input  logic                        bpdec_bp2_flush,
        input  logic                        fe_ctrl_flush,

        output logic                        rob_entry_wait_0,
        output logic                        rob_entry_valid,
        output logic                        rob_entry_invalid,
        output logic [ADDR_WIDTH-1:0]       rob_entry_pc,
        output logic                        rob_entry_nxt_valid,
        output logic                        rob_entry_nxt_invalid,
        output logic [FETCH_DATA_WIDTH-1:0] rob_entry_nxt_pld,

        input  logic                        filter_rden,
        input  logic                        filter_bypass,
        output logic [FETCH_DATA_WIDTH-1:0] filter_pld
    );

    logic                           entry_wait_data;    // prealloc and wait icache response
    logic                           entry_wait_lock;    // when flush and bp2 flush wait lock and wait data back
    logic                           entry_icache_valid; // receive icache valid
    logic                           entry_bp2_valid;    // receive bp2 valid
    logic                           entry_invalid;      // occur bp2 flush
    logic                           entry_valid;        // after bp2 valid and icache valid
    logic [FETCH_DATA_WIDTH-1:0]    entry_pld;

    logic                           entry_enable;
    logic                           entry_nxt_valid;
    logic                           entry_nxt_invalid;
    logic [FETCH_DATA_WIDTH-1:0]    entry_nxt_pld;
    logic                           entry_valid_enable;
    logic                           entry_invalid_enable;

    logic                           icache_vld;
    logic wait_lock_enable;


    assign filter_pld               = entry_pld;
    assign rob_entry_wait_0         = entry_wait_data||entry_wait_lock;
    assign rob_entry_valid          = entry_valid;
    assign rob_entry_invalid        = entry_invalid;
    assign rob_entry_nxt_valid      = entry_nxt_valid;
    assign rob_entry_nxt_invalid    = entry_nxt_invalid;
    assign rob_entry_nxt_pld        = entry_nxt_pld;


    //=======================================================
    // state icache 
    //=======================================================
    // wait data for prealloc and wait icache response
    // 1. flush: change to wait lock state
    // 2. icache data receive: change to icache valid state 
    // 3. prealloc: from idle to wait data
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_wait_data <= 1'b0;
        else if(fe_ctrl_flush)                      entry_wait_data <= 1'b0;
        else if(icache_ack_vld)                     entry_wait_data <= 1'b0;
        else if(icache_prealloc)                    entry_wait_data <= 1'b1;
    end

    // wait lock when flush and wait data, when icache back, reset lock 
    // 1. data back: change to idle 
    // 2. flush: from wait data to wait lock 
    assign wait_lock_enable = fe_ctrl_flush && (entry_wait_data||icache_prealloc);

    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_wait_lock <= 1'b0;
        else if(icache_ack_vld)                     entry_wait_lock <= 1'b0;
        else if(wait_lock_enable)                   entry_wait_lock <= 1'b1;
    end

    // icache valid when wait data back
    // 1. data back: from wait data to icache valid 
    // 2. flush: change to idle 
    // 3. bp2 vld or bp2_valid: change to valid
    assign icache_vld               = ~entry_wait_lock && icache_ack_vld;

    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_icache_valid <= 1'b0;
        else if(fe_ctrl_flush)                      entry_icache_valid <= 1'b0;
        else if(bpdec_bp2_vld||entry_bp2_valid)     entry_icache_valid <= 1'b0;
        else if(icache_vld)                         entry_icache_valid <= 1'b1;
    end

    //=======================================================
    // state predictor
    //=======================================================
    // bp2 valid
    // 1. flush: reset
    // 2. icache_vld or icache_valid: change to valid
    // 3. bp2 valid back: set
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_bp2_valid <= 1'b0;
        else if(fe_ctrl_flush)                      entry_bp2_valid <= 1'b0;
        else if(icache_vld||entry_icache_valid)     entry_bp2_valid <= 1'b0;
        else if(bpdec_bp2_vld)                      entry_bp2_valid <= 1'b1;
    end
    //=======================================================
    // final state
    //=======================================================
    // invalid for which entry need release
    // 1. flush: reset 
    // 2. bypass: change to idle 
    // 3. bp2 flush: set
    assign entry_invalid_enable     = fe_ctrl_flush||bpdec_bp2_flush||filter_bypass;

    always_comb begin
        if(fe_ctrl_flush)                           entry_nxt_invalid = 1'b0;
        else if(filter_bypass)                      entry_nxt_invalid = 1'b0;
        else if(bpdec_bp2_flush)                    entry_nxt_invalid = 1'b1;
        else                                        entry_nxt_invalid = entry_invalid;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_invalid <= 1'b0;
        else if(entry_invalid_enable)               entry_invalid <= entry_nxt_invalid;
    end

    // valid for entry is ready
    // 1. flush: reset 
    // 2. rden or bypass: change to idle 
    // 3. enable: set
    assign entry_enable         = (entry_bp2_valid||bpdec_bp2_vld)&&(entry_icache_valid||icache_vld);
    assign entry_valid_enable   = entry_enable||filter_rden||filter_bypass||fe_ctrl_flush;

    always_comb begin 
        if(fe_ctrl_flush)                           entry_nxt_valid = 1'b0;
        else if(filter_rden|filter_bypass)          entry_nxt_valid = 1'b0;
        else if(entry_enable)                       entry_nxt_valid = 1'b1;
        else                                        entry_nxt_valid = entry_valid;
    end 

    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_valid <= 1'b0;
        else if(entry_valid_enable)                 entry_valid <= entry_nxt_valid;
    end

    always_comb begin 
        if(icache_ack_vld)                          entry_nxt_pld = icache_ack_pld;
        else                                        entry_nxt_pld = entry_pld;
    end 

    // icache ack pld
    always_ff @(posedge clk or negedge rst_n) begin
        if (~rst_n)                                 entry_pld <= {FETCH_DATA_WIDTH{1'b0}};
        else if(icache_ack_vld)                     entry_pld <= entry_nxt_pld;
    end

    // `ifdef SIM_ROB

    // logic [63:0] cycle;
    // assign cycle = u_toy_scalar.u_core.u_toy_commit.cycle;

    // initial begin
    //     forever begin
    //         @(posedge clk)
    //             if(icache_ack_vld) begin
    //                 if(entry_wait_0_pc != icache_ack_pc) begin
    //                     $display("ROB Error Detect: pcgen: [pc=%h], icache:[pc=%h][cycle=%0d]", entry_wait_0_pc, icache_ack_pc, cycle);
    //                 end
    //             end
    //     end
    // end

    // `endif

endmodule 