module toy_agu
    import toy_pack::*;
(
    input  logic                      clk               ,
    input  logic                      rst_n             ,

    input  logic                      s_vld             ,
    output logic                      s_rdy             ,
    input  eu_pkg                     s_pld             ,
    input  logic                      s_stu_en          ,

    output agu_pkg                    m_pld             ,
    input  logic                      m_rdy             ,
    output logic                      m_vld             

);

    logic [2:0]             funct3      ;
    logic [REG_WIDTH-1:0]   raw_address ;

    assign funct3       = s_pld.inst_pld`INST_FIELD_FUNCT3         ;
    assign s_rdy        = m_rdy                 ;
    assign m_vld        = s_vld                 ;
//===================================================================
// memory access
//===================================================================

    assign raw_address            = s_pld.reg_rs1_val + s_pld.inst_imm    ;
    assign m_pld.mem_req_opcode   = s_stu_en ? TOY_BUS_WRITE : TOY_BUS_READ ;
    assign m_pld.mem_req_data     = s_pld.reg_rs2_val       ;
    assign m_pld.mem_req_addr     = raw_address             ;
    assign m_pld.mem_req_sideband = {raw_address[4:0],s_pld.inst_id,s_pld.inst_rd,s_pld.inst_rd_en,s_pld.inst_fp_rd_en,funct3};
    // 6+6+1+1+3
    // funct3       [2:0]
    // fp_rd_en     [3]
    // int_rd_en    [4]
    // rd_index     [10:5]
    // index_id     [16:11]
    // addr_align   [20:17]

    always_comb begin
        case(funct3) 
            F3_LB,F3_LBU:   m_pld.mem_req_strb = 4'h1     ;
            F3_LH,F3_LHU:   m_pld.mem_req_strb = 4'h3     ;
            F3_LW:          m_pld.mem_req_strb = 4'hf     ;
            default:        m_pld.mem_req_strb = 4'h0     ;
        endcase
    end




//===================================================================
// sim debug
//===================================================================





    // `ifdef TOY_SIM

    // logic [ADDR_WIDTH-1:0] mem_req_addr_dly;
    
    // logic                   is_store    ;

    // assign is_store = s_store_vld;
    // always_ff @(posedge clk) begin
    //     if(mem_req_vld & mem_req_rdy) mem_req_addr_dly <= mem_req_addr;
    // end


    // initial begin
    //     if($test$plusargs("DEBUG")) begin
    //         forever begin
    //             @(posedge clk)

    //             if(is_store) begin
    //                 $display("[lsu][st] receive a inst[%h] = [0x%h].",pc, instruction_pld); 
    //                 $display("[lsu][st] mem[0x%h] = %h = reg[%0d]", mem_req_addr, rs2_val, instruction_pld`INST_FIELD_RS2);
    //             end

    //             if(reg_wr_en) begin
    //                 if($isunknown(mem_ack_data))
    //                     $display("[lsu][ls] ERROR!!!! load x val from mem[%h]= %h.", mem_req_addr_dly, mem_ack_data);
    //                 $display("[lsu][ld] reg[%d] = %h, mem[%h]= %h", reg_index, reg_val, mem_req_addr_dly, mem_ack_data);
    //                 $display("[lsu][ld] mem data: %h.", mem_ack_data);
    //             end

    //             if(instruction_vld && instruction_rdy && ~is_store) begin
    //                 $display("[lsu][ld] receive a inst[%h] = [0x%h].",pc, instruction_pld); 
    //             end

    //         end
    //     end
    // end
    // `endif


endmodule


    //    if(opcode == OPC_AMO) begin
    //        if (instruction_pld[31:27] == AMOSC) begin
    //            if(sc_success)                      reg_val = 32'b0;
    //            else                                reg_val = 32'b1;
    //        end 
    //        else                                    reg_val = mem_ack_data;
    //    end
    //    else begin
    //        case(funct3_dly)
    //        F3_LB       : reg_val = {{24{shifted_rd_data[7]}}   ,   shifted_rd_data[7:0]    };
    //        F3_LBU      : reg_val = {24'b0                      ,   shifted_rd_data[7:0]    };
    //        F3_LH       : reg_val = {{16{shifted_rd_data[15]}}  ,   shifted_rd_data[15:0]   };
    //        F3_LHU      : reg_val = {16'b0                      ,   shifted_rd_data[15:0]   };
    //        F3_LW       : reg_val = mem_ack_data;
    //        default     : reg_val = mem_ack_data;
    //        endcase
    //    end
    //end 





    //always_ff @(posedge clk) begin
    //    reg_wr_en           <= (inst_rd_en & instruction_vld & instruction_rdy) | (~amo_store & instruction_vld & is_amo );
    //end 
