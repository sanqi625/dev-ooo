module cmn_list_lead_one_rev #(
    parameter  int unsigned ENTRY_NUM = 16,
    localparam int unsigned AWIDTH    = $clog2(ENTRY_NUM),
    parameter  int unsigned REQ_NUM   = 4
) (
    input  logic [ENTRY_NUM-1:0] v_entry_vld,
    output logic [ENTRY_NUM-1:0] v_free_idx_oh  [REQ_NUM-1:0],
    output logic [AWIDTH-1   :0] v_free_idx_bin [REQ_NUM-1:0],
    output logic [REQ_NUM-1  :0] v_free_vld 
);

//==============================================================
// Internal signal
//==============================================================
    logic [ENTRY_NUM-1:0] vv_vld        [REQ_NUM  :0];
    logic [ENTRY_NUM-1:0] vv_ld_one_rev [REQ_NUM-1:0];
    logic [ENTRY_NUM-1:0] vv_ld_one     [REQ_NUM-1:0];

    genvar i,j;

    logic [ENTRY_NUM-1:0] v_entry_vld_rev;
    generate 
        for(i=0; i < ENTRY_NUM; i=i+1) begin: gen_rev
            assign v_entry_vld_rev[i] = v_entry_vld[ENTRY_NUM-1-i];
        end 
    endgenerate 
//==============================================================
// generate free onehot
//==============================================================
    assign vv_vld[0] = v_entry_vld_rev;

    generate
        for (i=0;i<REQ_NUM;i=i+1) begin
            // leading zero
            assign vv_ld_one_rev[i][0] = vv_vld[i][0];
            for (j=1;j<ENTRY_NUM;j=j+1) begin
                assign vv_ld_one_rev[i][j] = (vv_vld[i][j]) && (~|vv_vld[i][j-1:0]);
            end
            // XOR mask
            assign vv_vld[i+1] = vv_vld[i]^vv_ld_one_rev[i];
        end
    endgenerate

    generate 
        for(i=0; i < REQ_NUM; i=i+1) begin: gen_req_chl
            for(j=0; j < ENTRY_NUM; j=j+1) begin: gen_rev_back 
                assign vv_ld_one[i][j] = vv_ld_one_rev[i][ENTRY_NUM-1-j];
            end 
        end
    endgenerate 

    assign v_free_idx_oh = vv_ld_one;

//==============================================================
// Free channel valid
//==============================================================
    generate
        for (i=0;i<REQ_NUM;i=i+1) begin
            assign v_free_vld[i] = |vv_ld_one[i];
        end
    endgenerate

//==============================================================
// onehot to binary
//==============================================================
    generate
        for (i=0;i<REQ_NUM;i=i+1) begin
            cmn_onehot2bin #(
                .ONEHOT_WIDTH(ENTRY_NUM)
            )u_oh2bin(
                .onehot_in(v_free_idx_oh[i] ),
                .bin_out  (v_free_idx_bin[i])
            );
        end
    endgenerate

endmodule