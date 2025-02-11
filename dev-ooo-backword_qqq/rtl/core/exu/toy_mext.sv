

module toy_mext
    import toy_pack::*;
    (
        input  logic                      clk                    ,
        input  logic                      rst_n                  ,

        input  logic                      instruction_vld        ,
        output logic                      instruction_rdy        ,
        input  eu_pkg                     instruction_pld        ,
        output logic                      instruction_forward_rdy,
        // input  logic [INST_WIDTH-1:0]     inst_pld     ,
        // input  logic [INST_IDX_WIDTH-1:0] instruction_idx     ,
        // input  logic [PHY_REG_ID_WIDTH-1:0]inst_rd_idx        ,
        // input  logic                      inst_rd_en          ,
        // input  logic                      mext_c_ext          ,  
        // input  logic [4:0]                arch_reg_index      , 
        // input  logic [REG_WIDTH-1:0]      rs1_val             ,
        // input  logic [REG_WIDTH-1:0]      rs2_val             ,
        // input  logic [ADDR_WIDTH-1:0]     inst_pc             ,
        input  logic                       cancel_en             ,
        //forward
        output logic                       mext_reg_wr_forward_en,
        output logic [PHY_REG_ID_WIDTH-1:0]mext_reg_forward_index,
        // reg access
        output logic [PHY_REG_ID_WIDTH-1:0]reg_index             ,
        output logic                       reg_wr_en             ,
        output logic [REG_WIDTH-1       :0]reg_val               ,
        output logic [INST_IDX_WIDTH-1  :0]mext_commit_id        ,
        output logic                       mext_commit_en      
    
    );
    
//===================================================================
// package unpack
//===================================================================

    logic [INST_WIDTH-1:0]      inst_pld                ;
    logic [INST_IDX_WIDTH-1:0]  instruction_idx         ;
    logic [PHY_REG_ID_WIDTH-1:0]inst_rd_idx             ;
    logic                       inst_rd_en              ;
    logic                       mext_c_ext              ;  
    logic [4:0]                 arch_reg_index          ; 
    logic [REG_WIDTH-1:0]       rs1_val                 ;
    logic [REG_WIDTH-1:0]       rs2_val                 ;
    logic [ADDR_WIDTH-1:0]      inst_pc                 ;

    assign inst_pld             = instruction_pld.inst_pld      ;
    assign instruction_idx      = instruction_pld.inst_id       ;
    assign inst_rd_idx          = instruction_pld.inst_rd       ;
    assign inst_rd_en           = instruction_pld.inst_rd_en    ;
    assign mext_c_ext           = instruction_pld.c_ext         ;
    assign arch_reg_index       = instruction_pld.arch_reg_index;
    assign rs1_val              = instruction_pld.reg_rs1_val   ;
    assign rs2_val              = instruction_pld.reg_rs2_val   ;
    assign inst_pc              = instruction_pld.inst_pc       ;

//===================================================================
// logic 
//===================================================================

    logic                                   mul_flag        ;
    logic                                   div_flag        ;
    logic                                   mul_forward_en  ;
    logic                                   div_forward_en  ;
    logic                                   mul_commit_en   ;
    logic                                   div_commit_en   ;
    logic                                   mul_wr_en       ;
    logic                                   div_wr_en       ;
    logic  [PHY_REG_ID_WIDTH-1      : 0]    mul_forward_index;
    logic  [PHY_REG_ID_WIDTH-1      : 0]    div_forward_index;

    logic        [2                 : 0]    funct3          ;
    logic signed [REG_WIDTH         : 0]    rs1_val_sign_ext;
    logic signed [REG_WIDTH         : 0]    rs2_val_sign_ext;
    logic signed [2*REG_WIDTH+1     : 0]    rs_mul_val      ;
    logic signed [REG_WIDTH-1       : 0]    rs_div_val      ;
    logic signed [REG_WIDTH-1       : 0]    rs_rem_val      ;
    logic signed [REG_WIDTH         : 0]    rs_div_temp     ;
    logic signed [REG_WIDTH         : 0]    rs_rem_temp     ;
    logic signed [REG_WIDTH         : 0]    rs2_val_div_sign_ext;
    logic        [MEXT_STAGES-1     : 0]    mul_en_d        ;
    logic        [MEXT_STAGES-1     : 0]    div_en_d        ;
    logic        [REG_WIDTH-1       : 0]    rs1_val_d1      ;
    logic        [REG_WIDTH-1       : 0]    rs2_val_d1      ;
    mext_pkg                                mul_out_pld     ;
    mext_pkg                                div_out_pld     ;
    mext_pkg                                mext_out_pld    ;
    mext_pkg                                mext_pld_d      [MEXT_STAGES-1:0];

//booth_wallace_mul
    logic                                   TC_a            ;
    logic                                   TC_b            ;
    logic signed [2*REG_WIDTH-1     : 0]    rs_mul_val_out  ;
    logic signed [2*REG_WIDTH-1     : 0]    rs_mul_val_d    [MUL_STAGES-1:0];

//===================================================================
// forward 
//===================================================================

    assign mul_forward_en         = mul_en_d[MUL_STAGES-FORWARD_NUM] && mext_pld_d[MUL_STAGES-FORWARD_NUM].inst_rd_en;
    assign div_forward_en         = div_en_d[DIV_STAGES-FORWARD_NUM] && mext_pld_d[DIV_STAGES-FORWARD_NUM].inst_rd_en;
    assign mul_forward_index      = mext_pld_d[MUL_STAGES-FORWARD_NUM].reg_index;
    assign div_forward_index      = mext_pld_d[DIV_STAGES-FORWARD_NUM].reg_index;

    assign mext_reg_wr_forward_en = mul_forward_en | div_forward_en;
    assign mext_reg_forward_index = mul_forward_en ? mul_forward_index : div_forward_index;


    generate
        for(genvar i=0;i<MEXT_STAGES;i=i+1)begin
            if(i==0)begin
                assign mul_en_d[i]                      = instruction_vld & instruction_rdy & ~cancel_en & mul_flag;
                assign div_en_d[i]                      = instruction_vld & instruction_rdy & ~cancel_en & div_flag;
                assign mext_pld_d[i].funct3             = funct3;
                assign mext_pld_d[i].reg_index          = inst_rd_idx;
                assign mext_pld_d[i].instruction_idx    = instruction_idx;
                assign mext_pld_d[i].inst_rd_en         = inst_rd_en;
                assign mext_pld_d[i].c_ext              = mext_c_ext;
                assign mext_pld_d[i].arch_reg_index     = arch_reg_index;
                assign mext_pld_d[i].inst_pc            = inst_pc;
                assign mext_pld_d[i].inst_pld           = inst_pld;
                assign mext_pld_d[i].rs2_val            = rs2_val;
                assign mext_pld_d[i].rs1_val            = rs1_val;
            end
            else begin
                always_ff @(posedge clk or negedge rst_n) begin
                    if(~rst_n)begin
                        mul_en_d[i]             <= 0;
                        div_en_d[i]             <= 0;
                        mext_pld_d[i]           <= {$bits(mext_pkg){1'b0}};
                    end
                    else if(cancel_en)begin
                        mul_en_d[i]             <= 0;
                        div_en_d[i]             <= 0;
                    end
                    else begin
                        mul_en_d[i]             <= mul_en_d[i-1]          ;
                        div_en_d[i]             <= div_en_d[i-1]          ;
                        mext_pld_d[i]           <= mext_pld_d[i-1]        ;
                    end
                end
            end
        end
    endgenerate

    assign rs2_val_d1 = mext_pld_d[0].rs2_val;
    assign rs1_val_d1 = mext_pld_d[0].rs1_val;

    assign funct3       = inst_pld`INST_FIELD_FUNCT3 ;
    assign reg_index    = mext_out_pld.reg_index        ;
    // for warning todo
    assign rs2_val_div_sign_ext = |rs2_val_d1 ? rs2_val_sign_ext : {(REG_WIDTH+1){1'b1}};

    always_comb begin
        case(mext_pld_d[0].funct3)
            F3_MUL,F3_MULHU,F3_DIVU,F3_REMU    : begin
                rs1_val_sign_ext = $signed({1'b0,rs1_val_d1})                 ;
                rs2_val_sign_ext = $signed({1'b0,rs2_val_d1})                 ;
            end
            F3_MULH,F3_DIV,F3_REM   : begin
                rs1_val_sign_ext = $signed(rs1_val_d1)                        ;
                rs2_val_sign_ext = $signed(rs2_val_d1)                        ;
            end
            F3_MULHSU : begin
                rs1_val_sign_ext = $signed(rs1_val_d1)                        ;
                rs2_val_sign_ext = $signed({1'b0,rs2_val_d1})                 ;
            end
            default   : begin
                rs1_val_sign_ext = $signed({1'b0,rs1_val_d1})                 ;
                rs2_val_sign_ext = $signed({1'b0,rs2_val_d1})                 ;
            end
        endcase
    end

    //booth_wallace_mul mul_stages delay
    generate
        for (genvar j=0;j<MUL_STAGES;j=j+1) begin
            if(j==0)begin
                assign rs_mul_val_d[j] = rs_mul_val_out;
            end 
            else begin
                always_ff @(posedge clk or negedge rst_n) begin 
                    if(~rst_n)begin 
                        rs_mul_val_d[j] <= {(2*REG_WIDTH){1'b0}};
                    end 
                    else begin 
                        rs_mul_val_d[j] <= rs_mul_val_d[j-1];
                    end 
                end 
            end
        end
    endgenerate

    assign TC_a = rs1_val_sign_ext[REG_WIDTH];
    assign TC_b = rs2_val_sign_ext[REG_WIDTH];

    always_comb begin
        mul_flag = 1'b0;
        div_flag = 1'b0;
        case(mext_pld_d[0].funct3)
            F3_MUL,F3_MULH,F3_MULHSU,F3_MULHU:begin
                mul_flag = 1'b1;
            end
            F3_DIV,F3_DIVU,F3_REM,F3_REMU:begin
                div_flag = 1'b1;
            end
        endcase
    end

    //DW_mult_pipe #(
    //    .a_width    (REG_WIDTH+1        ),
    //    .b_width    (REG_WIDTH+1        ),
    //    .num_stages (MUL_STAGES         ),
    //    .rst_mode   (2                  )
    //    )
    //metx_dw_mult(
    //    .clk        (clk                ),
    //    .rst_n      (rst_n              ),
    //    .en         (|mul_en_d[MUL_STAGES-1:0]),
    //    .tc         (1'b1               ),
    //    .a          (rs1_val_sign_ext   ),
    //    .b          (rs2_val_sign_ext   ),
    //    .product    (rs_mul_val         ));
    booth_wallace_mul #(
        .A_WIDTH        (REG_WIDTH          ),
        .B_WIDTH        (REG_WIDTH          ),
        .PRODUCT_WIDTH  (REG_WIDTH*2        ))
    u_booth_wallace_mul(
        .clk            (clk                ),
        .rst_n          (rst_n              ),
        .TC_a           (TC_a               ),
        .TC_b           (TC_b               ),
        .mul_a          (rs1_val_d1         ),
        .mul_b          (rs2_val_d1         ),
        .product        (rs_mul_val_out     ));    
    DW_div_pipe # (
        .a_width    (REG_WIDTH+1        ),
        .b_width    (REG_WIDTH+1        ),
        .tc_mode    (1'b1               ),
        .rem_mode   (1'b1               ),
        .num_stages (DIV_STAGES         ),
        .rst_mode   (2                  ))
    metx_dw_div(
        .clk        (clk                ),
        .rst_n      (rst_n              ),
        .en         (|div_en_d[DIV_STAGES-1:0]),
        .a          (rs1_val_sign_ext   ), 
        .b          (rs2_val_div_sign_ext), 
        .quotient   (rs_div_temp        ), 
        .remainder  (rs_rem_temp        ), 
        .divide_by_0(                   ));

    assign rs_div_val   = |mext_out_pld.rs2_val ? rs_div_temp[REG_WIDTH-1 : 0] : {REG_WIDTH{1'b1}}; 
    assign rs_rem_val   = |mext_out_pld.rs2_val ? rs_rem_temp[REG_WIDTH-1 : 0] : mext_out_pld.rs1_val; 
    assign rs_mul_val   = rs_mul_val_d[MUL_STAGES-1];

    always_comb begin
        case(mext_out_pld.funct3)
            F3_MUL    : reg_val = rs_mul_val[REG_WIDTH-1:0]                 ;
            F3_MULH   : reg_val = rs_mul_val[2*REG_WIDTH-1:REG_WIDTH]       ;
            F3_MULHSU : reg_val = rs_mul_val[2*REG_WIDTH-1:REG_WIDTH]       ;
            F3_MULHU  : reg_val = rs_mul_val[2*REG_WIDTH-1:REG_WIDTH]       ;
            F3_DIV    : reg_val = rs_div_val[REG_WIDTH-1:0]                 ;
            F3_DIVU   : reg_val = rs_div_val[REG_WIDTH-1:0]                 ;
            F3_REM    : reg_val = rs_rem_val[REG_WIDTH-1:0]                 ;
            F3_REMU   : reg_val = rs_rem_val[REG_WIDTH-1:0]                 ;
            default   : reg_val = rs_rem_val[REG_WIDTH-1:0]                 ;
        endcase
    end

    assign mul_out_pld = mext_pld_d[MUL_STAGES-1];
    assign div_out_pld = mext_pld_d[DIV_STAGES-1];
    assign mext_out_pld = mul_commit_en ? mul_out_pld : div_out_pld;
    assign mul_commit_en = mul_en_d[MUL_STAGES-1];
    assign div_commit_en = div_en_d[DIV_STAGES-1];
    assign mul_wr_en = mul_en_d[MUL_STAGES-1] && mext_pld_d[MUL_STAGES-1].inst_rd_en;
    assign div_wr_en = div_en_d[DIV_STAGES-1] && mext_pld_d[DIV_STAGES-1].inst_rd_en;
    assign mext_commit_en   = mul_commit_en | div_commit_en   ;
    assign mext_commit_id     = mext_out_pld.instruction_idx   ;
    assign reg_wr_en        = mul_wr_en | div_wr_en  ;
    assign instruction_rdy  = ~div_en_d[DIV_STAGES-MUL_STAGES];
    assign instruction_forward_rdy  = ~div_en_d[DIV_STAGES-MUL_STAGES-FORWARD_NUM+1];

endmodule
