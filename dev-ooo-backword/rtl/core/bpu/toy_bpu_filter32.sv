module toy_bpu_filter
    import toy_pack::*;
    #(
        localparam  int unsigned FETCH_DATA_WIDTH = ADDR_WIDTH*FETCH_WRITE_CHANNEL
    )(
        input logic                                  clk,
        input logic                                  rst_n,

        // BTFIFO ==========================================
        output logic                                 btfifo_rdy,
        input  logic                                 btfifo_vld,
        input  bpu_pkg                               btfifo_pld,

        // ROB =============================================
        output logic                                 rob_rdy,
        input  logic                                 rob_vld,
        input  logic [FETCH_DATA_WIDTH-1:0]          rob_pld,

        // RAS =============================================
        output logic                                  ras_req_vld,
        output ras_pkg                                ras_req_pld,
        input  logic                                  ras_ack_vld,
        input  logic   [ADDR_WIDTH-1:0]               ras_ack_pld,

        // Fetch Queue =====================================
        input  logic                                 fetch_queue_rdy,
        output logic                                 fetch_queue_vld,
        output fetch_queue_pkg                       fetch_queue_pld [FILTER_CHANNEL-1:0],
        output logic           [FILTER_CHANNEL-1:0]  fetch_queue_en,

        // FE Controller ===================================
        input  logic                                 fe_ctrl_be_chgflw_vld,
        // input  logic                                 fe_ctrl_ras_chgflw,
        // input  bpu_pkg                               fe_ctrl_ras_pld,
        output logic                                 fe_ctrl_enqueue_vld,
        output logic   [ADDR_WIDTH-1:0]              fe_ctrl_enqueue_pld
    );

    logic [INST_WIDTH-1:0]                         v_inst_predec       [FILTER_CHANNEL-1:0];
    logic [ADDR_WIDTH-1:0]                         v_inst_pc           [FILTER_CHANNEL-1:0];
    logic [ADDR_WIDTH-1:0]                         v_inst_pc_nxt       [FILTER_CHANNEL-1:0];
    logic [FILTER_CHANNEL-1:0]                     v_inst_en;
    logic [FILTER_CHANNEL-1:0]                     v_inst_last;
    logic                                          is_call;
    logic                                          is_ret;
    logic [DATA_WIDTH/2-1:0]                       v_inst              [FILTER_CHANNEL-1:0];

    logic                                          dec_valid;
    logic [ADDR_WIDTH-1:0]                         dec_pred_pc;
    logic                                          dec_taken;
    logic [DATA_WIDTH-1:0]                         dec_data;

    logic [15:0]                                   v_dec_ena;
    logic [15:0]                                   v_dec_last;
    logic [FILTER_CHANNEL-1:0] [INST_WIDTH-1:0]    v_dec_predec;
    logic [FILTER_CHANNEL-1:0] [ADDR_WIDTH-1:0]    v_dec_pc;
    logic [FILTER_CHANNEL-1:0] [ADDR_WIDTH-1:0]    v_dec_pc_nxt;

    logic [BPU_OFFSET_WIDTH:0]                     full_offset;
    logic [INST_WIDTH-1:0]                         last_inst;
    logic [ADDR_WIDTH-1:0]                         real_tgt_pc;
    logic                                          use_ras;

    logic [16-1:0]                                 last_half_inst_buf;
    logic [ADDR_WIDTH-1:0]                         last_pc;
    logic                                          last_en;
    logic [16-1:0]                                 dec_last_half_inst;
    logic [ADDR_WIDTH-1:0]                         dec_last_pc;
    logic                                          dec_last_en;


    // to other module
    assign btfifo_rdy            = rob_vld && btfifo_vld && fetch_queue_rdy && ~fe_ctrl_be_chgflw_vld;
    assign rob_rdy               = rob_vld && btfifo_vld && fetch_queue_rdy && ~fe_ctrl_be_chgflw_vld;

    assign ras_req_vld           = rob_vld && btfifo_vld && fetch_queue_rdy && btfifo_pld.taken;
    assign ras_req_pld.inst_type = {is_ret, is_call};
    assign ras_req_pld.is_cext   = btfifo_pld.is_cext;
    assign ras_req_pld.carry     = btfifo_pld.carry;
    assign ras_req_pld.offset    = btfifo_pld.offset;
    assign ras_req_pld.pred_pc   = btfifo_pld.pred_pc;
    assign ras_req_pld.pc        = btfifo_pld.pred_pc + {full_offset, 1'b0};
    assign ras_req_pld.tgt_pc    = btfifo_pld.tgt_pc;
    assign ras_req_pld.taken     = btfifo_pld.taken;
    assign ras_req_pld.use_ras   = use_ras;

    assign fetch_queue_vld       = rob_vld && btfifo_vld && ~fe_ctrl_be_chgflw_vld;
    assign fetch_queue_en        = v_inst_en;
    generate
        for (genvar i = 0; i < FILTER_CHANNEL; i=i+1) begin: GEN_FQ
            assign fetch_queue_pld[i].inst                  = v_inst_predec[i];
            assign fetch_queue_pld[i].bypass.is_call        = is_call;
            assign fetch_queue_pld[i].bypass.is_ret         = is_ret;
            assign fetch_queue_pld[i].bypass.pc             = v_inst_pc[i];
            assign fetch_queue_pld[i].bypass.is_last        = v_inst_last[i];
            assign fetch_queue_pld[i].bypass.bypass.carry   = btfifo_pld.is_cext;
            assign fetch_queue_pld[i].bypass.bypass.is_cext = btfifo_pld.carry;
            assign fetch_queue_pld[i].bypass.bypass.pred_pc = btfifo_pld.pred_pc;
            assign fetch_queue_pld[i].bypass.bypass.taken   = btfifo_pld.taken;
            assign fetch_queue_pld[i].bypass.bypass.tgt_pc  = (v_inst_last[i]) ? real_tgt_pc : v_inst_pc_nxt[i];
            assign fetch_queue_pld[i].bypass.bypass.offset  = btfifo_pld.offset;
        end
    endgenerate

    assign fe_ctrl_enqueue_vld   = rob_vld && btfifo_vld && fetch_queue_rdy && ~fe_ctrl_be_chgflw_vld;
    assign fe_ctrl_enqueue_pld   = btfifo_pld.pred_pc;

    //=================================================
    // pre-decode
    //=================================================
    assign use_ras               = is_ret && (ras_ack_pld != btfifo_pld.tgt_pc) && ras_ack_vld && btfifo_pld.taken;
    assign real_tgt_pc           = use_ras ? ras_ack_pld : btfifo_pld.tgt_pc;

    assign dec_valid             = rob_vld && btfifo_vld && fetch_queue_rdy && ~fe_ctrl_be_chgflw_vld;
    assign dec_pred_pc           = btfifo_pld.pred_pc;
    assign dec_taken             = btfifo_pld.taken;
    assign dec_data              = rob_pld;
    assign full_offset           = btfifo_pld.full_offset;

    generate
        for(genvar i=0; i<FILTER_CHANNEL; i=i+1) begin: GEN_INST_RES
            assign v_inst_predec[i] = v_dec_predec[i];
            assign v_inst_pc[i]     = v_dec_pc[i];
            assign v_inst_pc_nxt[i] = v_dec_pc_nxt[i];
        end
    endgenerate

    assign v_inst_en    = v_dec_ena & {16{dec_valid}};
    assign v_inst_last  = v_dec_last;

    filter_predecoder u_predecoder(
        .dec_pred_pc      (dec_pred_pc          ),
        .dec_offset       (full_offset          ),
        .dec_data         (dec_data             ),
        .dec_taken        (dec_taken            ),
        .dec_last_vld_in  (last_en              ),
        .dec_last_inst_in (last_half_inst_buf   ),
        .dec_last_pc_in   (last_pc              ),
        .v_dec_inst       (v_dec_predec         ),
        .v_dec_ena        (v_dec_ena            ),
        .v_dec_last       (v_dec_last           ),
        .v_dec_pc         (v_dec_pc             ),
        .v_dec_nxt_pc     (v_dec_pc_nxt         ),
        .dec_last_vld_out (dec_last_en          ),
        .dec_last_inst_out(dec_last_half_inst   ),
        .dec_last_pc_out  (dec_last_pc          )
    );

    cmn_lead_one_rev #(
        .ENTRY_NUM(16                           )
    ) u_ld_one (
        .v_entry_vld   (v_inst_en               ),
        .v_free_idx_oh (             ),
        .v_free_idx_bin(                        ),
        .v_free_vld    (                        )
    );


    //=================================================
    // for last ffset but full inst
    //=================================================
    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                                   last_en <= 1'b0;
        else if(fe_ctrl_be_chgflw_vld)               last_en <= 1'b0;
        else if(fetch_queue_rdy&&fetch_queue_vld) begin
            if(dec_last_en)                          last_en <= 1'b1;
            else                                     last_en <= 1'b0;
        end
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                  last_half_inst_buf <= {16{1'b0}};
        else if(dec_last_en)        last_half_inst_buf <= dec_last_half_inst;
    end

    always_ff @(posedge clk or negedge rst_n) begin
        if(~rst_n)                      last_pc <= {ADDR_WIDTH{1'b0}};
        else if(dec_last_en&&dec_valid) last_pc <= dec_last_pc;
    end


    //=================================================
    // to ras
    //=================================================
    
    generate
        for(genvar i=0; i < FILTER_CHANNEL; i=i+1) begin: GEN_INST_VEC
            if (i==(FILTER_CHANNEL-1))  assign v_inst[i] = {16'b0, rob_pld[i*16+15:i*16]};
            else                        assign v_inst[i] = {rob_pld[i*16+31:i*16]};
        end
    endgenerate

    // call
    // 1. jalr: rd == x1 or rd == x5;
    // 2. jal : rd == x1 or rd == x5;
    // 3. c.jalr
    // ret
    // 1. jalr: rs1 == x1 or rs1 == x5 and rs1!=rd;
    // 2. c.jr: rs1 ==x1 or rs1 == x5;
    // 3. c.jalr: rs1 == x5

    assign last_inst = v_inst[btfifo_pld.align_full_offset];

    assign is_call = (({last_inst[14:12],last_inst[6:0]} == 10'b000_1100111) && ((last_inst[11:7] == 5'b00001) || (last_inst[11:7] == 5'b00101))) //jalr
    || ((last_inst[6:0] == 7'b1101111) && ((last_inst[11:7] == 5'b00001) || (last_inst[11:7] == 5'b00101)))                                       //jal
    || (({last_inst[15:12],last_inst[6:0]} == 11'b1001_00000_10) && (last_inst[11:7] != 5'b0));                                                   //c.jalr

    assign is_ret  = (({last_inst[14:12],last_inst[6:0]} == 10'b000_1100111) && (last_inst[11:7] != last_inst[19:15]) && ((last_inst[19:15] == 5'b00001) || (last_inst[19:15] == 5'b00101)) && (last_inst[31:20] == 12'b0)) //jalr
    || (({last_inst[15:12],last_inst[6:0]} == 11'b1000_00000_10) && ((last_inst[11:7] == 5'b00001) || (last_inst[11:7] == 5'b00101)) && (last_inst[11:7] != 5'b00000))                                                      //jalr
    || (({last_inst[15:12],last_inst[6:0]} == 11'b1001_00000_10) && (last_inst[11:7] == 5'b00101));                                                                                                                         //c.jalr

endmodule 