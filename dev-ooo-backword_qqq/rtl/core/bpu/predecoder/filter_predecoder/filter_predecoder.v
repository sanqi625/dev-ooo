//[UHDL]Content Start [md5:c1cc383ab70a9495f8d68e349afc803f]
module filter_predecoder (
	input  [31:0]  dec_pred_pc      ,
	input  [3:0]   dec_offset       ,
	input  [255:0] dec_data         ,
	input          dec_taken        ,
	input          dec_last_vld_in  ,
	input  [15:0]  dec_last_inst_in ,
	input  [31:0]  dec_last_pc_in   ,
	output [511:0] v_dec_inst       ,
	output [15:0]  v_dec_ena        ,
	output [15:0]  v_dec_last       ,
	output [511:0] v_dec_pc         ,
	output [511:0] v_dec_nxt_pc     ,
	output         dec_last_vld_out ,
	output [15:0]  dec_last_inst_out,
	output [31:0]  dec_last_pc_out  );

	//Wire define for this module.
	wire [15:0]  v_ena                  ;
	wire [0:0]   v_ena_0                ;
	wire [0:0]   v_ena_1                ;
	wire [0:0]   v_ena_2                ;
	wire [0:0]   v_ena_3                ;
	wire [0:0]   v_ena_4                ;
	wire [0:0]   v_ena_5                ;
	wire [0:0]   v_ena_6                ;
	wire [0:0]   v_ena_7                ;
	wire [0:0]   v_ena_8                ;
	wire [0:0]   v_ena_9                ;
	wire [0:0]   v_ena_10               ;
	wire [0:0]   v_ena_11               ;
	wire [0:0]   v_ena_12               ;
	wire [0:0]   v_ena_13               ;
	wire [0:0]   v_ena_14               ;
	wire [0:0]   v_ena_15               ;
	wire [15:0]  inst_type              ;
	reg  [0:0]   last_buf_inst_type     ;
	reg  [0:0]   v_type_0               ;
	reg  [0:0]   v_type_1               ;
	reg  [0:0]   v_type_2               ;
	reg  [0:0]   v_type_3               ;
	reg  [0:0]   v_type_4               ;
	reg  [0:0]   v_type_5               ;
	reg  [0:0]   v_type_6               ;
	reg  [0:0]   v_type_7               ;
	reg  [0:0]   v_type_8               ;
	reg  [0:0]   v_type_9               ;
	reg  [0:0]   v_type_10              ;
	reg  [0:0]   v_type_11              ;
	reg  [0:0]   v_type_12              ;
	reg  [0:0]   v_type_13              ;
	reg  [0:0]   v_type_14              ;
	reg  [0:0]   v_type_15              ;
	reg  [255:0] inst                   ;
	reg  [15:0]  v_vld                  ;
	reg  [31:0]  align_pc_offset        ;
	reg  [15:0]  v_inst_type            ;
	reg  [271:0] inst_add_last          ;
	reg  [16:0]  v_vld_add_last         ;
	reg  [16:0]  v_ena_add_last         ;
	reg  [31:0]  v_pc_add_last          ;
	reg  [16:0]  v_inst_type_add_last   ;
	wire [255:0] v_dec_inst_first       ;
	wire [7:0]   v_dec_ena_first        ;
	wire [7:0]   v_dec_last_first       ;
	wire [255:0] v_dec_pc_first         ;
	wire [255:0] v_dec_nxt_pc_first     ;
	wire [0:0]   use_last_first         ;
	wire [0:0]   need_last_buf_first    ;
	reg  [0:0]   use_dec_last_sel_second;
	wire [32:0]  second_pred_pc         ;
	wire [255:0] v_dec_inst_second      ;
	wire [7:0]   v_dec_ena_second       ;
	wire [7:0]   v_dec_last_second      ;
	wire [255:0] v_dec_pc_second        ;
	wire [255:0] v_dec_nxt_pc_second    ;
	wire [0:0]   need_last_second       ;
	wire [32:0]  second_pred_pc_hf      ;
	wire [255:0] v_dec_inst_second_hf   ;
	wire [7:0]   v_dec_ena_second_hf    ;
	wire [7:0]   v_dec_last_second_hf   ;
	wire [255:0] v_dec_pc_second_hf     ;
	wire [255:0] v_dec_nxt_pc_second_hf ;
	wire [0:0]   need_last_second_hf    ;
	wire [511:0] v_dec_pc_merge         ;
	wire [511:0] v_dec_nxt_pc_merge     ;
	wire [511:0] v_dec_inst_merge       ;
	wire [15:0]  v_dec_ena_merge        ;
	wire [15:0]  v_dec_last_merge       ;
	reg  [255:0] v_dec_inst_sel_second  ;
	reg  [7:0]   v_dec_ena_sel_second   ;
	reg  [7:0]   v_dec_last_sel_second  ;
	reg  [255:0] v_dec_pc_sel_second    ;
	reg  [255:0] v_dec_nxt_pc_sel_second;
	reg  [0:0]   need_last_sel_second   ;
	wire [31:0]  v_dec_pc_merge_0       ;
	wire [31:0]  v_dec_pc_merge_1       ;
	wire [31:0]  v_dec_pc_merge_2       ;
	wire [31:0]  v_dec_pc_merge_3       ;
	reg  [31:0]  v_dec_pc_merge_4       ;
	reg  [31:0]  v_dec_pc_merge_5       ;
	reg  [31:0]  v_dec_pc_merge_6       ;
	reg  [31:0]  v_dec_pc_merge_7       ;
	reg  [31:0]  v_dec_pc_merge_8       ;
	reg  [31:0]  v_dec_pc_merge_9       ;
	reg  [31:0]  v_dec_pc_merge_10      ;
	reg  [31:0]  v_dec_pc_merge_11      ;
	reg  [31:0]  v_dec_pc_merge_12      ;
	reg  [31:0]  v_dec_pc_merge_13      ;
	reg  [31:0]  v_dec_pc_merge_14      ;
	reg  [31:0]  v_dec_pc_merge_15      ;
	wire [31:0]  v_dec_nxt_pc_merge_0   ;
	wire [31:0]  v_dec_nxt_pc_merge_1   ;
	wire [31:0]  v_dec_nxt_pc_merge_2   ;
	wire [31:0]  v_dec_nxt_pc_merge_3   ;
	reg  [31:0]  v_dec_nxt_pc_merge_4   ;
	reg  [31:0]  v_dec_nxt_pc_merge_5   ;
	reg  [31:0]  v_dec_nxt_pc_merge_6   ;
	reg  [31:0]  v_dec_nxt_pc_merge_7   ;
	reg  [31:0]  v_dec_nxt_pc_merge_8   ;
	reg  [31:0]  v_dec_nxt_pc_merge_9   ;
	reg  [31:0]  v_dec_nxt_pc_merge_10  ;
	reg  [31:0]  v_dec_nxt_pc_merge_11  ;
	reg  [31:0]  v_dec_nxt_pc_merge_12  ;
	reg  [31:0]  v_dec_nxt_pc_merge_13  ;
	reg  [31:0]  v_dec_nxt_pc_merge_14  ;
	reg  [31:0]  v_dec_nxt_pc_merge_15  ;
	wire [31:0]  v_dec_inst_merge_0     ;
	wire [31:0]  v_dec_inst_merge_1     ;
	wire [31:0]  v_dec_inst_merge_2     ;
	wire [31:0]  v_dec_inst_merge_3     ;
	reg  [31:0]  v_dec_inst_merge_4     ;
	reg  [31:0]  v_dec_inst_merge_5     ;
	reg  [31:0]  v_dec_inst_merge_6     ;
	reg  [31:0]  v_dec_inst_merge_7     ;
	reg  [31:0]  v_dec_inst_merge_8     ;
	reg  [31:0]  v_dec_inst_merge_9     ;
	reg  [31:0]  v_dec_inst_merge_10    ;
	reg  [31:0]  v_dec_inst_merge_11    ;
	reg  [31:0]  v_dec_inst_merge_12    ;
	reg  [31:0]  v_dec_inst_merge_13    ;
	reg  [31:0]  v_dec_inst_merge_14    ;
	reg  [31:0]  v_dec_inst_merge_15    ;
	wire [0:0]   v_dec_ena_merge_0      ;
	wire [0:0]   v_dec_ena_merge_1      ;
	wire [0:0]   v_dec_ena_merge_2      ;
	wire [0:0]   v_dec_ena_merge_3      ;
	reg  [0:0]   v_dec_ena_merge_4      ;
	reg  [0:0]   v_dec_ena_merge_5      ;
	reg  [0:0]   v_dec_ena_merge_6      ;
	reg  [0:0]   v_dec_ena_merge_7      ;
	reg  [0:0]   v_dec_ena_merge_8      ;
	reg  [0:0]   v_dec_ena_merge_9      ;
	reg  [0:0]   v_dec_ena_merge_10     ;
	reg  [0:0]   v_dec_ena_merge_11     ;
	reg  [0:0]   v_dec_ena_merge_12     ;
	reg  [0:0]   v_dec_ena_merge_13     ;
	reg  [0:0]   v_dec_ena_merge_14     ;
	reg  [0:0]   v_dec_ena_merge_15     ;
	wire [0:0]   v_dec_last_merge_0     ;
	wire [0:0]   v_dec_last_merge_1     ;
	wire [0:0]   v_dec_last_merge_2     ;
	wire [0:0]   v_dec_last_merge_3     ;
	reg  [0:0]   v_dec_last_merge_4     ;
	reg  [0:0]   v_dec_last_merge_5     ;
	reg  [0:0]   v_dec_last_merge_6     ;
	reg  [0:0]   v_dec_last_merge_7     ;
	reg  [0:0]   v_dec_last_merge_8     ;
	reg  [0:0]   v_dec_last_merge_9     ;
	reg  [0:0]   v_dec_last_merge_10    ;
	reg  [0:0]   v_dec_last_merge_11    ;
	reg  [0:0]   v_dec_last_merge_12    ;
	reg  [0:0]   v_dec_last_merge_13    ;
	reg  [0:0]   v_dec_last_merge_14    ;
	reg  [0:0]   v_dec_last_merge_15    ;
	reg  [0:0]   last_need_half         ;
	wire [32:0]  dec_last_pc_w          ;
	wire [15:0]  dec_last_inst_w        ;

	//Wire define for sub module.
	wire [31:0]  sub_first_pred_pc          ;
	wire [8:0]   sub_first_v_vld            ;
	wire [8:0]   sub_first_v_ena            ;
	wire [8:0]   sub_first_v_inst_type      ;
	wire [143:0] sub_first_data             ;
	wire [255:0] sub_first_v_dec_inst       ;
	wire [7:0]   sub_first_v_dec_ena        ;
	wire [7:0]   sub_first_v_dec_last       ;
	wire [255:0] sub_first_v_dec_pc         ;
	wire [255:0] sub_first_v_dec_nxt_pc     ;
	wire         sub_first_need_last_buf    ;
	wire         sub_first_use_last         ;
	wire [31:0]  sub_second_pred_pc         ;
	wire [8:0]   sub_second_v_vld           ;
	wire [8:0]   sub_second_v_ena           ;
	wire [8:0]   sub_second_v_inst_type     ;
	wire [143:0] sub_second_data            ;
	wire [255:0] sub_second_v_dec_inst      ;
	wire [7:0]   sub_second_v_dec_ena       ;
	wire [7:0]   sub_second_v_dec_last      ;
	wire [255:0] sub_second_v_dec_pc        ;
	wire [255:0] sub_second_v_dec_nxt_pc    ;
	wire         sub_second_need_last_buf   ;
	wire [31:0]  sub_second_hf_pred_pc      ;
	wire [8:0]   sub_second_hf_v_vld        ;
	wire [8:0]   sub_second_hf_v_ena        ;
	wire [8:0]   sub_second_hf_v_inst_type  ;
	wire [143:0] sub_second_hf_data         ;
	wire [255:0] sub_second_hf_v_dec_inst   ;
	wire [7:0]   sub_second_hf_v_dec_ena    ;
	wire [7:0]   sub_second_hf_v_dec_last   ;
	wire [255:0] sub_second_hf_v_dec_pc     ;
	wire [255:0] sub_second_hf_v_dec_nxt_pc ;
	wire         sub_second_hf_need_last_buf;

	//Wire define for Inout.

	//Wire sub module connect to this module and inter module connect.
	assign v_dec_inst = v_dec_inst_merge;
	
	assign v_dec_ena = v_dec_ena_merge;
	
	assign v_dec_last = v_dec_last_merge;
	
	assign v_dec_pc = v_dec_pc_merge;
	
	assign v_dec_nxt_pc = v_dec_nxt_pc_merge;
	
	assign dec_last_vld_out = (last_need_half && (!dec_taken));
	
	assign dec_last_inst_out = dec_last_inst_w;
	
	assign dec_last_pc_out = dec_last_pc_w[31:0];
	
	assign v_ena = {v_ena_15, v_ena_14, v_ena_13, v_ena_12, v_ena_11, v_ena_10, v_ena_9, v_ena_8, v_ena_7, v_ena_6, v_ena_5, v_ena_4, v_ena_3, v_ena_2, v_ena_1, v_ena_0};
	
	assign v_ena_0 = (dec_offset >= 4'b0);
	
	assign v_ena_1 = (dec_offset >= 4'b1);
	
	assign v_ena_2 = (dec_offset >= 4'b10);
	
	assign v_ena_3 = (dec_offset >= 4'b11);
	
	assign v_ena_4 = (dec_offset >= 4'b100);
	
	assign v_ena_5 = (dec_offset >= 4'b101);
	
	assign v_ena_6 = (dec_offset >= 4'b110);
	
	assign v_ena_7 = (dec_offset >= 4'b111);
	
	assign v_ena_8 = (dec_offset >= 4'b1000);
	
	assign v_ena_9 = (dec_offset >= 4'b1001);
	
	assign v_ena_10 = (dec_offset >= 4'b1010);
	
	assign v_ena_11 = (dec_offset >= 4'b1011);
	
	assign v_ena_12 = (dec_offset >= 4'b1100);
	
	assign v_ena_13 = (dec_offset >= 4'b1101);
	
	assign v_ena_14 = (dec_offset >= 4'b1110);
	
	assign v_ena_15 = (dec_offset >= 4'b1111);
	
	assign inst_type = {v_type_15, v_type_14, v_type_13, v_type_12, v_type_11, v_type_10, v_type_9, v_type_8, v_type_7, v_type_6, v_type_5, v_type_4, v_type_3, v_type_2, v_type_1, v_type_0};
	
	always @(*) begin
	    if((dec_last_inst_in[1:0] == 2'b11)) last_buf_inst_type = 1'b1;
	    else last_buf_inst_type = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[1:0] == 2'b11)) v_type_0 = 1'b1;
	    else v_type_0 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[17:16] == 2'b11)) v_type_1 = 1'b1;
	    else v_type_1 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[33:32] == 2'b11)) v_type_2 = 1'b1;
	    else v_type_2 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[49:48] == 2'b11)) v_type_3 = 1'b1;
	    else v_type_3 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[65:64] == 2'b11)) v_type_4 = 1'b1;
	    else v_type_4 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[81:80] == 2'b11)) v_type_5 = 1'b1;
	    else v_type_5 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[97:96] == 2'b11)) v_type_6 = 1'b1;
	    else v_type_6 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[113:112] == 2'b11)) v_type_7 = 1'b1;
	    else v_type_7 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[129:128] == 2'b11)) v_type_8 = 1'b1;
	    else v_type_8 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[145:144] == 2'b11)) v_type_9 = 1'b1;
	    else v_type_9 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[161:160] == 2'b11)) v_type_10 = 1'b1;
	    else v_type_10 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[177:176] == 2'b11)) v_type_11 = 1'b1;
	    else v_type_11 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[193:192] == 2'b11)) v_type_12 = 1'b1;
	    else v_type_12 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[209:208] == 2'b11)) v_type_13 = 1'b1;
	    else v_type_13 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[225:224] == 2'b11)) v_type_14 = 1'b1;
	    else v_type_14 = 1'b0;
	end
	
	always @(*) begin
	    if((dec_data[241:240] == 2'b11)) v_type_15 = 1'b1;
	    else v_type_15 = 1'b0;
	end
	
	always @(*) begin
	    case(dec_pred_pc[3:1])
	    3'b1 : inst = {16'b0, dec_data[255:16]};
	    3'b10 : inst = {32'b0, dec_data[255:32]};
	    3'b11 : inst = {48'b0, dec_data[255:48]};
	    3'b100 : inst = {64'b0, dec_data[255:64]};
	    3'b101 : inst = {80'b0, dec_data[255:80]};
	    3'b110 : inst = {96'b0, dec_data[255:96]};
	    3'b111 : inst = {112'b0, dec_data[255:112]};
	    default : inst = dec_data;
	    endcase
	end
	
	always @(*) begin
	    case(dec_pred_pc[3:1])
	    3'b1 : v_vld = {1'b0, 15'b111111111111111};
	    3'b10 : v_vld = {2'b0, 14'b11111111111111};
	    3'b11 : v_vld = {3'b0, 13'b1111111111111};
	    3'b100 : v_vld = {4'b0, 12'b111111111111};
	    3'b101 : v_vld = {5'b0, 11'b11111111111};
	    3'b110 : v_vld = {6'b0, 10'b1111111111};
	    3'b111 : v_vld = {7'b0, 9'b111111111};
	    default : v_vld = 16'b1111111111111111;
	    endcase
	end
	
	always @(*) begin
	    case(dec_pred_pc[3:1])
	    3'b1 : align_pc_offset = {32'b11100};
	    3'b10 : align_pc_offset = {32'b11010};
	    3'b11 : align_pc_offset = {32'b11000};
	    3'b100 : align_pc_offset = {32'b10110};
	    3'b101 : align_pc_offset = {32'b10100};
	    3'b110 : align_pc_offset = {32'b10010};
	    3'b111 : align_pc_offset = {32'b10000};
	    default : align_pc_offset = 32'b11110;
	    endcase
	end
	
	always @(*) begin
	    case(dec_pred_pc[3:1])
	    3'b1 : v_inst_type = {1'b0, inst_type[15:1]};
	    3'b10 : v_inst_type = {2'b0, inst_type[15:2]};
	    3'b11 : v_inst_type = {3'b0, inst_type[15:3]};
	    3'b100 : v_inst_type = {4'b0, inst_type[15:4]};
	    3'b101 : v_inst_type = {5'b0, inst_type[15:5]};
	    3'b110 : v_inst_type = {6'b0, inst_type[15:6]};
	    3'b111 : v_inst_type = {7'b0, inst_type[15:7]};
	    default : v_inst_type = inst_type;
	    endcase
	end
	
	always @(*) begin
	    if(dec_last_vld_in) inst_add_last = {inst, dec_last_inst_in};
	    else inst_add_last = {16'b0, inst};
	end
	
	always @(*) begin
	    if(dec_last_vld_in) v_vld_add_last = {v_vld, 1'b1};
	    else v_vld_add_last = {1'b0, v_vld};
	end
	
	always @(*) begin
	    if(dec_last_vld_in) v_ena_add_last = {v_ena, 1'b1};
	    else v_ena_add_last = {1'b0, v_ena};
	end
	
	always @(*) begin
	    if(dec_last_vld_in) v_pc_add_last = dec_last_pc_in;
	    else v_pc_add_last = dec_pred_pc;
	end
	
	always @(*) begin
	    if(dec_last_vld_in) v_inst_type_add_last = {v_inst_type, last_buf_inst_type};
	    else v_inst_type_add_last = {1'b0, v_inst_type};
	end
	
	assign v_dec_inst_first = sub_first_v_dec_inst;
	
	assign v_dec_ena_first = sub_first_v_dec_ena;
	
	assign v_dec_last_first = (sub_first_v_dec_last & ({8{(!use_dec_last_sel_second)}}));
	
	assign v_dec_pc_first = sub_first_v_dec_pc;
	
	assign v_dec_nxt_pc_first = sub_first_v_dec_nxt_pc;
	
	assign use_last_first = sub_first_use_last;
	
	assign need_last_buf_first = sub_first_need_last_buf;
	
	always @(*) begin
	    if(use_last_first) use_dec_last_sel_second = (|v_dec_ena_second);
	    else use_dec_last_sel_second = (|v_dec_ena_second_hf);
	end
	
	assign second_pred_pc = (v_pc_add_last + 32'b10010);
	
	assign v_dec_inst_second = sub_second_v_dec_inst;
	
	assign v_dec_ena_second = sub_second_v_dec_ena;
	
	assign v_dec_last_second = sub_second_v_dec_last;
	
	assign v_dec_pc_second = sub_second_v_dec_pc;
	
	assign v_dec_nxt_pc_second = sub_second_v_dec_nxt_pc;
	
	assign need_last_second = sub_second_need_last_buf;
	
	assign second_pred_pc_hf = (v_pc_add_last + 32'b10000);
	
	assign v_dec_inst_second_hf = sub_second_hf_v_dec_inst;
	
	assign v_dec_ena_second_hf = sub_second_hf_v_dec_ena;
	
	assign v_dec_last_second_hf = sub_second_hf_v_dec_last;
	
	assign v_dec_pc_second_hf = sub_second_hf_v_dec_pc;
	
	assign v_dec_nxt_pc_second_hf = sub_second_hf_v_dec_nxt_pc;
	
	assign need_last_second_hf = sub_second_hf_need_last_buf;
	
	assign v_dec_pc_merge = {v_dec_pc_merge_15, v_dec_pc_merge_14, v_dec_pc_merge_13, v_dec_pc_merge_12, v_dec_pc_merge_11, v_dec_pc_merge_10, v_dec_pc_merge_9, v_dec_pc_merge_8, v_dec_pc_merge_7, v_dec_pc_merge_6, v_dec_pc_merge_5, v_dec_pc_merge_4, v_dec_pc_merge_3, v_dec_pc_merge_2, v_dec_pc_merge_1, v_dec_pc_merge_0};
	
	assign v_dec_nxt_pc_merge = {v_dec_nxt_pc_merge_15, v_dec_nxt_pc_merge_14, v_dec_nxt_pc_merge_13, v_dec_nxt_pc_merge_12, v_dec_nxt_pc_merge_11, v_dec_nxt_pc_merge_10, v_dec_nxt_pc_merge_9, v_dec_nxt_pc_merge_8, v_dec_nxt_pc_merge_7, v_dec_nxt_pc_merge_6, v_dec_nxt_pc_merge_5, v_dec_nxt_pc_merge_4, v_dec_nxt_pc_merge_3, v_dec_nxt_pc_merge_2, v_dec_nxt_pc_merge_1, v_dec_nxt_pc_merge_0};
	
	assign v_dec_inst_merge = {v_dec_inst_merge_15, v_dec_inst_merge_14, v_dec_inst_merge_13, v_dec_inst_merge_12, v_dec_inst_merge_11, v_dec_inst_merge_10, v_dec_inst_merge_9, v_dec_inst_merge_8, v_dec_inst_merge_7, v_dec_inst_merge_6, v_dec_inst_merge_5, v_dec_inst_merge_4, v_dec_inst_merge_3, v_dec_inst_merge_2, v_dec_inst_merge_1, v_dec_inst_merge_0};
	
	assign v_dec_ena_merge = {v_dec_ena_merge_15, v_dec_ena_merge_14, v_dec_ena_merge_13, v_dec_ena_merge_12, v_dec_ena_merge_11, v_dec_ena_merge_10, v_dec_ena_merge_9, v_dec_ena_merge_8, v_dec_ena_merge_7, v_dec_ena_merge_6, v_dec_ena_merge_5, v_dec_ena_merge_4, v_dec_ena_merge_3, v_dec_ena_merge_2, v_dec_ena_merge_1, v_dec_ena_merge_0};
	
	assign v_dec_last_merge = {v_dec_last_merge_15, v_dec_last_merge_14, v_dec_last_merge_13, v_dec_last_merge_12, v_dec_last_merge_11, v_dec_last_merge_10, v_dec_last_merge_9, v_dec_last_merge_8, v_dec_last_merge_7, v_dec_last_merge_6, v_dec_last_merge_5, v_dec_last_merge_4, v_dec_last_merge_3, v_dec_last_merge_2, v_dec_last_merge_1, v_dec_last_merge_0};
	
	always @(*) begin
	    if(use_last_first) v_dec_inst_sel_second = v_dec_inst_second;
	    else v_dec_inst_sel_second = v_dec_inst_second_hf;
	end
	
	always @(*) begin
	    if(use_last_first) v_dec_ena_sel_second = v_dec_ena_second;
	    else v_dec_ena_sel_second = v_dec_ena_second_hf;
	end
	
	always @(*) begin
	    if(use_last_first) v_dec_last_sel_second = v_dec_last_second;
	    else v_dec_last_sel_second = v_dec_last_second_hf;
	end
	
	always @(*) begin
	    if(use_last_first) v_dec_pc_sel_second = v_dec_pc_second;
	    else v_dec_pc_sel_second = v_dec_pc_second_hf;
	end
	
	always @(*) begin
	    if(use_last_first) v_dec_nxt_pc_sel_second = v_dec_nxt_pc_second;
	    else v_dec_nxt_pc_sel_second = v_dec_nxt_pc_second_hf;
	end
	
	always @(*) begin
	    if(use_last_first) need_last_sel_second = need_last_second;
	    else need_last_sel_second = need_last_second_hf;
	end
	
	assign v_dec_pc_merge_0 = v_dec_pc_first[31:0];
	
	assign v_dec_pc_merge_1 = v_dec_pc_first[63:32];
	
	assign v_dec_pc_merge_2 = v_dec_pc_first[95:64];
	
	assign v_dec_pc_merge_3 = v_dec_pc_first[127:96];
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_4 = v_dec_pc_sel_second[31:0];
	    else v_dec_pc_merge_4 = v_dec_pc_first[159:128];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_5 = v_dec_pc_sel_second[63:32];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_5 = v_dec_pc_sel_second[31:0];
	    else v_dec_pc_merge_5 = v_dec_pc_first[191:160];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_6 = v_dec_pc_sel_second[95:64];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_6 = v_dec_pc_sel_second[63:32];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_6 = v_dec_pc_sel_second[31:0];
	    else v_dec_pc_merge_6 = v_dec_pc_first[223:192];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_7 = v_dec_pc_sel_second[127:96];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_7 = v_dec_pc_sel_second[95:64];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_7 = v_dec_pc_sel_second[63:32];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_7 = v_dec_pc_sel_second[31:0];
	    else v_dec_pc_merge_7 = v_dec_pc_first[255:224];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_8 = v_dec_pc_sel_second[159:128];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_8 = v_dec_pc_sel_second[127:96];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_8 = v_dec_pc_sel_second[95:64];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_8 = v_dec_pc_sel_second[63:32];
	    else v_dec_pc_merge_8 = v_dec_pc_sel_second[31:0];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_9 = v_dec_pc_sel_second[191:160];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_9 = v_dec_pc_sel_second[159:128];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_9 = v_dec_pc_sel_second[127:96];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_9 = v_dec_pc_sel_second[95:64];
	    else v_dec_pc_merge_9 = v_dec_pc_sel_second[63:32];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_10 = v_dec_pc_sel_second[223:192];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_10 = v_dec_pc_sel_second[191:160];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_10 = v_dec_pc_sel_second[159:128];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_10 = v_dec_pc_sel_second[127:96];
	    else v_dec_pc_merge_10 = v_dec_pc_sel_second[95:64];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_11 = v_dec_pc_sel_second[255:224];
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_11 = v_dec_pc_sel_second[223:192];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_11 = v_dec_pc_sel_second[191:160];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_11 = v_dec_pc_sel_second[159:128];
	    else v_dec_pc_merge_11 = v_dec_pc_sel_second[127:96];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_12 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_12 = v_dec_pc_sel_second[255:224];
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_12 = v_dec_pc_sel_second[223:192];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_12 = v_dec_pc_sel_second[191:160];
	    else v_dec_pc_merge_12 = v_dec_pc_sel_second[159:128];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_13 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_13 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_13 = v_dec_pc_sel_second[255:224];
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_13 = v_dec_pc_sel_second[223:192];
	    else v_dec_pc_merge_13 = v_dec_pc_sel_second[191:160];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_14 = v_dec_pc_sel_second[255:224];
	    else v_dec_pc_merge_14 = v_dec_pc_sel_second[223:192];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_pc_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_pc_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_pc_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[7])) v_dec_pc_merge_15 = 32'b0;
	    else v_dec_pc_merge_15 = v_dec_pc_sel_second[255:224];
	end
	
	assign v_dec_nxt_pc_merge_0 = v_dec_nxt_pc_first[31:0];
	
	assign v_dec_nxt_pc_merge_1 = v_dec_nxt_pc_first[63:32];
	
	assign v_dec_nxt_pc_merge_2 = v_dec_nxt_pc_first[95:64];
	
	assign v_dec_nxt_pc_merge_3 = v_dec_nxt_pc_first[127:96];
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_4 = v_dec_nxt_pc_sel_second[31:0];
	    else v_dec_nxt_pc_merge_4 = v_dec_nxt_pc_first[159:128];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_5 = v_dec_nxt_pc_sel_second[63:32];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_5 = v_dec_nxt_pc_sel_second[31:0];
	    else v_dec_nxt_pc_merge_5 = v_dec_nxt_pc_first[191:160];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_6 = v_dec_nxt_pc_sel_second[95:64];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_6 = v_dec_nxt_pc_sel_second[63:32];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_6 = v_dec_nxt_pc_sel_second[31:0];
	    else v_dec_nxt_pc_merge_6 = v_dec_nxt_pc_first[223:192];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_7 = v_dec_nxt_pc_sel_second[127:96];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_7 = v_dec_nxt_pc_sel_second[95:64];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_7 = v_dec_nxt_pc_sel_second[63:32];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_7 = v_dec_nxt_pc_sel_second[31:0];
	    else v_dec_nxt_pc_merge_7 = v_dec_nxt_pc_first[255:224];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_8 = v_dec_nxt_pc_sel_second[159:128];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_8 = v_dec_nxt_pc_sel_second[127:96];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_8 = v_dec_nxt_pc_sel_second[95:64];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_8 = v_dec_nxt_pc_sel_second[63:32];
	    else v_dec_nxt_pc_merge_8 = v_dec_nxt_pc_sel_second[31:0];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_9 = v_dec_nxt_pc_sel_second[191:160];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_9 = v_dec_nxt_pc_sel_second[159:128];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_9 = v_dec_nxt_pc_sel_second[127:96];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_9 = v_dec_nxt_pc_sel_second[95:64];
	    else v_dec_nxt_pc_merge_9 = v_dec_nxt_pc_sel_second[63:32];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_10 = v_dec_nxt_pc_sel_second[223:192];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_10 = v_dec_nxt_pc_sel_second[191:160];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_10 = v_dec_nxt_pc_sel_second[159:128];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_10 = v_dec_nxt_pc_sel_second[127:96];
	    else v_dec_nxt_pc_merge_10 = v_dec_nxt_pc_sel_second[95:64];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_11 = v_dec_nxt_pc_sel_second[255:224];
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_11 = v_dec_nxt_pc_sel_second[223:192];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_11 = v_dec_nxt_pc_sel_second[191:160];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_11 = v_dec_nxt_pc_sel_second[159:128];
	    else v_dec_nxt_pc_merge_11 = v_dec_nxt_pc_sel_second[127:96];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_12 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_12 = v_dec_nxt_pc_sel_second[255:224];
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_12 = v_dec_nxt_pc_sel_second[223:192];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_12 = v_dec_nxt_pc_sel_second[191:160];
	    else v_dec_nxt_pc_merge_12 = v_dec_nxt_pc_sel_second[159:128];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_13 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_13 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_13 = v_dec_nxt_pc_sel_second[255:224];
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_13 = v_dec_nxt_pc_sel_second[223:192];
	    else v_dec_nxt_pc_merge_13 = v_dec_nxt_pc_sel_second[191:160];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_14 = v_dec_nxt_pc_sel_second[255:224];
	    else v_dec_nxt_pc_merge_14 = v_dec_nxt_pc_sel_second[223:192];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_nxt_pc_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_nxt_pc_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_nxt_pc_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[7])) v_dec_nxt_pc_merge_15 = 32'b0;
	    else v_dec_nxt_pc_merge_15 = v_dec_nxt_pc_sel_second[255:224];
	end
	
	assign v_dec_inst_merge_0 = v_dec_inst_first[31:0];
	
	assign v_dec_inst_merge_1 = v_dec_inst_first[63:32];
	
	assign v_dec_inst_merge_2 = v_dec_inst_first[95:64];
	
	assign v_dec_inst_merge_3 = v_dec_inst_first[127:96];
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_4 = v_dec_inst_sel_second[31:0];
	    else v_dec_inst_merge_4 = v_dec_inst_first[159:128];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_5 = v_dec_inst_sel_second[63:32];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_5 = v_dec_inst_sel_second[31:0];
	    else v_dec_inst_merge_5 = v_dec_inst_first[191:160];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_6 = v_dec_inst_sel_second[95:64];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_6 = v_dec_inst_sel_second[63:32];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_6 = v_dec_inst_sel_second[31:0];
	    else v_dec_inst_merge_6 = v_dec_inst_first[223:192];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_7 = v_dec_inst_sel_second[127:96];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_7 = v_dec_inst_sel_second[95:64];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_7 = v_dec_inst_sel_second[63:32];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_7 = v_dec_inst_sel_second[31:0];
	    else v_dec_inst_merge_7 = v_dec_inst_first[255:224];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_8 = v_dec_inst_sel_second[159:128];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_8 = v_dec_inst_sel_second[127:96];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_8 = v_dec_inst_sel_second[95:64];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_8 = v_dec_inst_sel_second[63:32];
	    else v_dec_inst_merge_8 = v_dec_inst_sel_second[31:0];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_9 = v_dec_inst_sel_second[191:160];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_9 = v_dec_inst_sel_second[159:128];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_9 = v_dec_inst_sel_second[127:96];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_9 = v_dec_inst_sel_second[95:64];
	    else v_dec_inst_merge_9 = v_dec_inst_sel_second[63:32];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_10 = v_dec_inst_sel_second[223:192];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_10 = v_dec_inst_sel_second[191:160];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_10 = v_dec_inst_sel_second[159:128];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_10 = v_dec_inst_sel_second[127:96];
	    else v_dec_inst_merge_10 = v_dec_inst_sel_second[95:64];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_11 = v_dec_inst_sel_second[255:224];
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_11 = v_dec_inst_sel_second[223:192];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_11 = v_dec_inst_sel_second[191:160];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_11 = v_dec_inst_sel_second[159:128];
	    else v_dec_inst_merge_11 = v_dec_inst_sel_second[127:96];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_12 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_12 = v_dec_inst_sel_second[255:224];
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_12 = v_dec_inst_sel_second[223:192];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_12 = v_dec_inst_sel_second[191:160];
	    else v_dec_inst_merge_12 = v_dec_inst_sel_second[159:128];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_13 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_13 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_13 = v_dec_inst_sel_second[255:224];
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_13 = v_dec_inst_sel_second[223:192];
	    else v_dec_inst_merge_13 = v_dec_inst_sel_second[191:160];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_14 = 32'b0;
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_14 = v_dec_inst_sel_second[255:224];
	    else v_dec_inst_merge_14 = v_dec_inst_sel_second[223:192];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_inst_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[5])) v_dec_inst_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[6])) v_dec_inst_merge_15 = 32'b0;
	    else if((!v_dec_ena_first[7])) v_dec_inst_merge_15 = 32'b0;
	    else v_dec_inst_merge_15 = v_dec_inst_sel_second[255:224];
	end
	
	assign v_dec_ena_merge_0 = v_dec_ena_first[0];
	
	assign v_dec_ena_merge_1 = v_dec_ena_first[1];
	
	assign v_dec_ena_merge_2 = v_dec_ena_first[2];
	
	assign v_dec_ena_merge_3 = v_dec_ena_first[3];
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_4 = v_dec_ena_sel_second[0];
	    else v_dec_ena_merge_4 = v_dec_ena_first[4];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_5 = v_dec_ena_sel_second[1];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_5 = v_dec_ena_sel_second[0];
	    else v_dec_ena_merge_5 = v_dec_ena_first[5];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_6 = v_dec_ena_sel_second[2];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_6 = v_dec_ena_sel_second[1];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_6 = v_dec_ena_sel_second[0];
	    else v_dec_ena_merge_6 = v_dec_ena_first[6];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_7 = v_dec_ena_sel_second[3];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_7 = v_dec_ena_sel_second[2];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_7 = v_dec_ena_sel_second[1];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_7 = v_dec_ena_sel_second[0];
	    else v_dec_ena_merge_7 = v_dec_ena_first[7];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_8 = v_dec_ena_sel_second[4];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_8 = v_dec_ena_sel_second[3];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_8 = v_dec_ena_sel_second[2];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_8 = v_dec_ena_sel_second[1];
	    else v_dec_ena_merge_8 = v_dec_ena_sel_second[0];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_9 = v_dec_ena_sel_second[5];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_9 = v_dec_ena_sel_second[4];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_9 = v_dec_ena_sel_second[3];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_9 = v_dec_ena_sel_second[2];
	    else v_dec_ena_merge_9 = v_dec_ena_sel_second[1];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_10 = v_dec_ena_sel_second[6];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_10 = v_dec_ena_sel_second[5];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_10 = v_dec_ena_sel_second[4];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_10 = v_dec_ena_sel_second[3];
	    else v_dec_ena_merge_10 = v_dec_ena_sel_second[2];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_11 = v_dec_ena_sel_second[7];
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_11 = v_dec_ena_sel_second[6];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_11 = v_dec_ena_sel_second[5];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_11 = v_dec_ena_sel_second[4];
	    else v_dec_ena_merge_11 = v_dec_ena_sel_second[3];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_12 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_12 = v_dec_ena_sel_second[7];
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_12 = v_dec_ena_sel_second[6];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_12 = v_dec_ena_sel_second[5];
	    else v_dec_ena_merge_12 = v_dec_ena_sel_second[4];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_13 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_13 = 1'b0;
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_13 = v_dec_ena_sel_second[7];
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_13 = v_dec_ena_sel_second[6];
	    else v_dec_ena_merge_13 = v_dec_ena_sel_second[5];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_14 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_14 = 1'b0;
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_14 = 1'b0;
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_14 = v_dec_ena_sel_second[7];
	    else v_dec_ena_merge_14 = v_dec_ena_sel_second[6];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_ena_merge_15 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_ena_merge_15 = 1'b0;
	    else if((!v_dec_ena_first[6])) v_dec_ena_merge_15 = 1'b0;
	    else if((!v_dec_ena_first[7])) v_dec_ena_merge_15 = 1'b0;
	    else v_dec_ena_merge_15 = v_dec_ena_sel_second[7];
	end
	
	assign v_dec_last_merge_0 = v_dec_last_first[0];
	
	assign v_dec_last_merge_1 = v_dec_last_first[1];
	
	assign v_dec_last_merge_2 = v_dec_last_first[2];
	
	assign v_dec_last_merge_3 = v_dec_last_first[3];
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_4 = v_dec_last_sel_second[0];
	    else v_dec_last_merge_4 = v_dec_last_first[4];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_5 = v_dec_last_sel_second[1];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_5 = v_dec_last_sel_second[0];
	    else v_dec_last_merge_5 = v_dec_last_first[5];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_6 = v_dec_last_sel_second[2];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_6 = v_dec_last_sel_second[1];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_6 = v_dec_last_sel_second[0];
	    else v_dec_last_merge_6 = v_dec_last_first[6];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_7 = v_dec_last_sel_second[3];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_7 = v_dec_last_sel_second[2];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_7 = v_dec_last_sel_second[1];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_7 = v_dec_last_sel_second[0];
	    else v_dec_last_merge_7 = v_dec_last_first[7];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_8 = v_dec_last_sel_second[4];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_8 = v_dec_last_sel_second[3];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_8 = v_dec_last_sel_second[2];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_8 = v_dec_last_sel_second[1];
	    else v_dec_last_merge_8 = v_dec_last_sel_second[0];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_9 = v_dec_last_sel_second[5];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_9 = v_dec_last_sel_second[4];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_9 = v_dec_last_sel_second[3];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_9 = v_dec_last_sel_second[2];
	    else v_dec_last_merge_9 = v_dec_last_sel_second[1];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_10 = v_dec_last_sel_second[6];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_10 = v_dec_last_sel_second[5];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_10 = v_dec_last_sel_second[4];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_10 = v_dec_last_sel_second[3];
	    else v_dec_last_merge_10 = v_dec_last_sel_second[2];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_11 = v_dec_last_sel_second[7];
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_11 = v_dec_last_sel_second[6];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_11 = v_dec_last_sel_second[5];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_11 = v_dec_last_sel_second[4];
	    else v_dec_last_merge_11 = v_dec_last_sel_second[3];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_12 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_12 = v_dec_last_sel_second[7];
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_12 = v_dec_last_sel_second[6];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_12 = v_dec_last_sel_second[5];
	    else v_dec_last_merge_12 = v_dec_last_sel_second[4];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_13 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_13 = 1'b0;
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_13 = v_dec_last_sel_second[7];
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_13 = v_dec_last_sel_second[6];
	    else v_dec_last_merge_13 = v_dec_last_sel_second[5];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_14 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_14 = 1'b0;
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_14 = 1'b0;
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_14 = v_dec_last_sel_second[7];
	    else v_dec_last_merge_14 = v_dec_last_sel_second[6];
	end
	
	always @(*) begin
	    if((!v_dec_ena_first[4])) v_dec_last_merge_15 = 1'b0;
	    else if((!v_dec_ena_first[5])) v_dec_last_merge_15 = 1'b0;
	    else if((!v_dec_ena_first[6])) v_dec_last_merge_15 = 1'b0;
	    else if((!v_dec_ena_first[7])) v_dec_last_merge_15 = 1'b0;
	    else v_dec_last_merge_15 = v_dec_last_sel_second[7];
	end
	
	always @(*) begin
	    if(need_last_buf_first) last_need_half = 1'b1;
	    else if(use_last_first) last_need_half = need_last_second;
	    else last_need_half = need_last_second_hf;
	end
	
	assign dec_last_pc_w = ({dec_pred_pc[31:4], 4'b0} + 32'b11110);
	
	assign dec_last_inst_w = dec_data[255:240];
	

	//Wire this module connect to sub module.
	assign sub_first_pred_pc = v_pc_add_last;
	
	assign sub_first_v_vld = v_vld_add_last[8:0];
	
	assign sub_first_v_ena = v_ena_add_last[8:0];
	
	assign sub_first_v_inst_type = v_inst_type_add_last[8:0];
	
	assign sub_first_data = inst_add_last[143:0];
	
	assign sub_second_pred_pc = second_pred_pc[31:0];
	
	assign sub_second_v_vld = {1'b0, v_vld_add_last[16:9]};
	
	assign sub_second_v_ena = {1'b0, v_ena_add_last[16:9]};
	
	assign sub_second_v_inst_type = {1'b0, v_inst_type_add_last[16:9]};
	
	assign sub_second_data = {16'b0, inst_add_last[271:144]};
	
	assign sub_second_hf_pred_pc = second_pred_pc_hf[31:0];
	
	assign sub_second_hf_v_vld = v_vld_add_last[16:8];
	
	assign sub_second_hf_v_ena = v_ena_add_last[16:8];
	
	assign sub_second_hf_v_inst_type = v_inst_type_add_last[16:8];
	
	assign sub_second_hf_data = inst_add_last[271:128];
	

	//module inst.
	filter_subpredecoder_type_first sub_first (
		.pred_pc(sub_first_pred_pc),
		.v_vld(sub_first_v_vld),
		.v_ena(sub_first_v_ena),
		.v_inst_type(sub_first_v_inst_type),
		.data(sub_first_data),
		.v_dec_inst(sub_first_v_dec_inst),
		.v_dec_ena(sub_first_v_dec_ena),
		.v_dec_last(sub_first_v_dec_last),
		.v_dec_pc(sub_first_v_dec_pc),
		.v_dec_nxt_pc(sub_first_v_dec_nxt_pc),
		.need_last_buf(sub_first_need_last_buf),
		.use_last(sub_first_use_last));
	filter_subpredecoder_type_second sub_second (
		.pred_pc(sub_second_pred_pc),
		.v_vld(sub_second_v_vld),
		.v_ena(sub_second_v_ena),
		.v_inst_type(sub_second_v_inst_type),
		.data(sub_second_data),
		.v_dec_inst(sub_second_v_dec_inst),
		.v_dec_ena(sub_second_v_dec_ena),
		.v_dec_last(sub_second_v_dec_last),
		.v_dec_pc(sub_second_v_dec_pc),
		.v_dec_nxt_pc(sub_second_v_dec_nxt_pc),
		.need_last_buf(sub_second_need_last_buf));
	filter_subpredecoder_type_second_half sub_second_hf (
		.pred_pc(sub_second_hf_pred_pc),
		.v_vld(sub_second_hf_v_vld),
		.v_ena(sub_second_hf_v_ena),
		.v_inst_type(sub_second_hf_v_inst_type),
		.data(sub_second_hf_data),
		.v_dec_inst(sub_second_hf_v_dec_inst),
		.v_dec_ena(sub_second_hf_v_dec_ena),
		.v_dec_last(sub_second_hf_v_dec_last),
		.v_dec_pc(sub_second_hf_v_dec_pc),
		.v_dec_nxt_pc(sub_second_hf_v_dec_nxt_pc),
		.need_last_buf(sub_second_hf_need_last_buf));

endmodule
//[UHDL]Content End [md5:c1cc383ab70a9495f8d68e349afc803f]

