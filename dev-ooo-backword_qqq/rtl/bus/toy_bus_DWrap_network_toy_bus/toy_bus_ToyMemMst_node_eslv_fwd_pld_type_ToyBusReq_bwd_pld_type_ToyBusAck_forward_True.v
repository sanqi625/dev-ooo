//[UHDL]Content Start [md5:dd5d1e4ec740c198f32c0b61e122b48c]
module toy_bus_ToyMemMst_node_eslv_fwd_pld_type_ToyBusReq_bwd_pld_type_ToyBusAck_forward_True (
	input          clk                  ,
	input          rst_n                ,
	input          in0_req_vld          ,
	output         in0_req_rdy          ,
	input  [31:0]  in0_req_addr         ,
	input  [31:0]  in0_req_strb         ,
	input  [255:0] in0_req_data         ,
	input          in0_req_opcode       ,
	input  [3:0]   in0_req_src_id       ,
	input  [3:0]   in0_req_tgt_id       ,
	input  [31:0]  in0_req_sideband     ,
	output         in0_ack_vld          ,
	input          in0_ack_rdy          ,
	output         in0_ack_opcode       ,
	output [255:0] in0_ack_data         ,
	output [31:0]  in0_ack_sideband     ,
	output [3:0]   in0_ack_src_id       ,
	output [3:0]   in0_ack_tgt_id       ,
	output         out0_mem_en          ,
	output [31:0]  out0_mem_addr        ,
	input  [255:0] out0_mem_rd_data     ,
	output [255:0] out0_mem_wr_data     ,
	output [31:0]  out0_mem_wr_byte_en  ,
	output         out0_mem_wr_en       ,
	output [31:0]  out0_mem_req_sideband,
	input  [31:0]  out0_mem_ack_sideband);

	//Wire define for this module.
	reg [0:0] vld_reg_0    ;
	reg [3:0] node_id_reg_0;
	reg [0:0] vld_reg_1    ;
	reg [3:0] node_id_reg_1;

	//Wire define for sub module.

	//Wire define for Inout.

	//Wire sub module connect to this module and inter module connect.
	assign in0_req_rdy = 1'b1;
	
	assign in0_ack_vld = vld_reg_1;
	
	assign in0_ack_opcode = 1'b0;
	
	assign in0_ack_data = out0_mem_rd_data;
	
	assign in0_ack_sideband = out0_mem_ack_sideband;
	
	assign in0_ack_src_id = 4'b0;
	
	assign in0_ack_tgt_id = node_id_reg_1;
	
	assign out0_mem_en = in0_req_vld;
	
	assign out0_mem_addr = {8'b0, in0_req_addr[28:5]};
	
	assign out0_mem_wr_data = in0_req_data;
	
	assign out0_mem_wr_byte_en = in0_req_strb;
	
	assign out0_mem_wr_en = in0_req_opcode;
	
	assign out0_mem_req_sideband = in0_req_sideband;
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) vld_reg_0 <= 1'b0;
	    else vld_reg_0 <= (in0_req_vld && (!in0_req_opcode));
	end
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) node_id_reg_0 <= 4'b0;
	    else node_id_reg_0 <= in0_req_src_id;
	end
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) vld_reg_1 <= 1'b0;
	    else vld_reg_1 <= vld_reg_0;
	end
	
	always @(posedge clk or negedge rst_n) begin
	    if(~rst_n) node_id_reg_1 <= 4'b0;
	    else node_id_reg_1 <= node_id_reg_0;
	end
	

	//Wire this module connect to sub module.

	//module inst.

endmodule
//[UHDL]Content End [md5:dd5d1e4ec740c198f32c0b61e122b48c]

