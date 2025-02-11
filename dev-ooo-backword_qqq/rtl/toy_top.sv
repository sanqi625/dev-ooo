

module toy_top 
    import toy_pack::*;
    ();

    logic                           clk                      ;
    logic                           rst_n                    ;

    logic [ADDR_WIDTH-1:0]          inst_mem_addr            ;
    logic [BUS_DATA_WIDTH-1:0]      inst_mem_rd_data         ;
    logic [BUS_DATA_WIDTH-1:0]      inst_mem_wr_data         ;
    logic [BUS_DATA_WIDTH/8-1:0]    inst_mem_wr_byte_en      ;
    logic                           inst_mem_wr_en           ;
    logic                           inst_mem_en              ;
    logic [FETCH_SB_WIDTH-1:0]      inst_mem_req_sideband    ;
    logic [FETCH_SB_WIDTH-1:0]      inst_mem_ack_sideband    ;

    logic [ADDR_WIDTH-1:0]          dtcm_mem_addr            ;
    logic [BUS_DATA_WIDTH-1:0]      dtcm_mem_rd_data         ;
    logic [BUS_DATA_WIDTH-1:0]      dtcm_mem_wr_data         ;
    logic [BUS_DATA_WIDTH/8-1:0]    dtcm_mem_wr_byte_en      ;
    logic                           dtcm_mem_wr_en           ;
    logic                           dtcm_mem_en              ;
    logic [FETCH_SB_WIDTH-1:0]      dtcm_mem_req_sideband    ;
    logic [FETCH_SB_WIDTH-1:0]      dtcm_mem_ack_sideband    ;

    logic                           fetch_mem_ack_vld       ;
    logic                           fetch_mem_ack_rdy       ;
    logic [FETCH_DATA_WIDTH-1:0]    fetch_mem_ack_data      ;
    //logic [ROB_ENTRY_ID_WIDTH-1:0]  fetch_mem_ack_entry_id  ;
    logic [1+ICACHE_REQ_OPCODE_WIDTH+MSHR_ENTRY_INDEX_WIDTH+ROB_ENTRY_ID_WIDTH-1:0]fetch_mem_ack_entry_id;
    logic [ADDR_WIDTH-1:0]          fetch_mem_req_addr      ;
    logic                           fetch_mem_req_vld       ;
    logic                           fetch_mem_req_rdy       ;
    logic [1+ICACHE_REQ_OPCODE_WIDTH+MSHR_ENTRY_INDEX_WIDTH+ROB_ENTRY_ID_WIDTH-1:0]  fetch_mem_req_entry_id  ;

    logic [ADDR_WIDTH-1:0]          ext_mem_addr             ;
    logic [BUS_DATA_WIDTH-1:0]      ext_mem_rd_data          ;
    logic [BUS_DATA_WIDTH-1:0]      ext_mem_wr_data          ;
    logic [BUS_DATA_WIDTH/8-1:0]    ext_mem_wr_byte_en       ;
    logic                           ext_mem_wr_en            ;
    logic                           ext_mem_en               ;



//============================================================
// Core
//============================================================

    toy_scalar u_toy_scalar (
                             .clk                    (clk                   ),
                             .rst_n                  (rst_n                 ),

                             .fetch_mem_ack_vld      (fetch_mem_ack_vld       ),
                             .fetch_mem_ack_rdy      (fetch_mem_ack_rdy       ),
                             .fetch_mem_ack_data     (fetch_mem_ack_data      ),
                             .fetch_mem_ack_entry_id (fetch_mem_ack_entry_id  ),
                             .fetch_mem_req_entry_id (fetch_mem_req_entry_id  ),
                             .fetch_mem_req_addr     (fetch_mem_req_addr      ),
                             .fetch_mem_req_vld      (fetch_mem_req_vld       ),
                             .fetch_mem_req_rdy      (fetch_mem_req_rdy       ),

                             .inst_mem_addr          (inst_mem_addr        ),
                             .inst_mem_rd_data       (inst_mem_rd_data     ),
                             .inst_mem_wr_data       (inst_mem_wr_data     ),
                             .inst_mem_wr_byte_en    (inst_mem_wr_byte_en  ),
                             .inst_mem_wr_en         (inst_mem_wr_en       ),
                             .inst_mem_en            (inst_mem_en          ),
                             .inst_mem_req_sideband  (inst_mem_req_sideband),
                             .inst_mem_ack_sideband  (inst_mem_ack_sideband),

                             .dtcm_mem_addr          (dtcm_mem_addr        ),
                             .dtcm_mem_rd_data       (dtcm_mem_rd_data     ),
                             .dtcm_mem_wr_data       (dtcm_mem_wr_data     ),
                             .dtcm_mem_wr_byte_en    (dtcm_mem_wr_byte_en  ),
                             .dtcm_mem_wr_en         (dtcm_mem_wr_en       ),
                             .dtcm_mem_en            (dtcm_mem_en          ),
                             .dtcm_mem_req_sideband  (dtcm_mem_req_sideband),
                             .dtcm_mem_ack_sideband  (dtcm_mem_ack_sideband),

                             .ext_mem_addr           (ext_mem_addr           ),
                             .ext_mem_rd_data        (ext_mem_rd_data        ),
                             .ext_mem_wr_data        (ext_mem_wr_data        ),
                             .ext_mem_wr_byte_en     (ext_mem_wr_byte_en     ),
                             .ext_mem_wr_en          (ext_mem_wr_en          ),
                             .ext_mem_en             (ext_mem_en             ),

                             .intr_meip              (1'b0                   ),
                             .intr_msip              (1'b0                   ),
        
                             .custom_instruction_vld (                       ),
                             .custom_instruction_rdy (1'b1                   ),
                             .custom_instruction_pld (                       ),
                             .custom_rs1_val         (                       ),
                             .custom_rs2_val         (                       ),
                             .custom_pc              (                       ));


//============================================================
// icache mem sim model
//============================================================
    toy_itcm u_mem_model (
                       .clk                   (clk                   ),
                       .rst_n                 (rst_n                 ),
                       .fetch_mem_ack_vld     (fetch_mem_ack_vld     ),
                       .fetch_mem_ack_rdy     (fetch_mem_ack_rdy     ),
                       .fetch_mem_ack_data    (fetch_mem_ack_data    ),
                       .fetch_mem_ack_entry_id(fetch_mem_ack_entry_id),
                       .fetch_mem_req_addr    (fetch_mem_req_addr    ),
                       .fetch_mem_req_vld     (fetch_mem_req_vld     ),
                       .fetch_mem_req_rdy     (fetch_mem_req_rdy     ),
                       .fetch_mem_req_entry_id(fetch_mem_req_entry_id)
                      ); 

//============================================================
// Memory
//============================================================
    toy_mem_top u_toy_mem_top(
                              .clk                        (clk                   ),
                              .rst_n                      (rst_n                 ),
                              .inst_mem_addr              (inst_mem_addr         ), 
                              .inst_mem_rd_data           (inst_mem_rd_data      ), 
                              .inst_mem_wr_data           (inst_mem_wr_data      ), 
                              .inst_mem_wr_byte_en        (inst_mem_wr_byte_en   ), 
                              .inst_mem_wr_en             (inst_mem_wr_en        ), 
                              .inst_mem_en                (inst_mem_en           ), 
                              .inst_mem_req_sideband      (inst_mem_req_sideband ), 
                              .inst_mem_ack_sideband      (inst_mem_ack_sideband ), 
                              .dtcm_mem_addr              (dtcm_mem_addr         ), 
                              .dtcm_mem_wr_data           (dtcm_mem_wr_data      ), 
                              .dtcm_mem_rd_data           (dtcm_mem_rd_data      ), 
                              .dtcm_mem_wr_byte_en        (dtcm_mem_wr_byte_en   ), 
                              .dtcm_mem_wr_en             (dtcm_mem_wr_en        ), 
                              .dtcm_mem_en                (dtcm_mem_en           ), 
                              .dtcm_mem_req_sideband      (dtcm_mem_req_sideband ), 
                              .dtcm_mem_ack_sideband      (dtcm_mem_ack_sideband )

                             );


//============================================================
// Env Slave
//============================================================

    toy_env_slv #(
                  .ADDR_WIDTH (ADDR_WIDTH         ),
                  .DATA_WIDTH (BUS_DATA_WIDTH     ))
    u_toy_env_slv(
                  .clk                    (clk                ),
                  .rst_n                  (rst_n              ),
                  .en                     (ext_mem_en         ),
                  .addr                   (ext_mem_addr       ),
                  .rd_data                (ext_mem_rd_data    ),
                  .wr_data                (ext_mem_wr_data    ),
                  .wr_byte_en             (ext_mem_wr_byte_en ),
                  .wr_en                  (ext_mem_wr_en      ));

    initial begin
        if($test$plusargs("WAVE")) begin
            $fsdbDumpfile("wave.fsdb");
            $fsdbDumpvars("+all");
            $fsdbDumpMDA;
            $fsdbDumpon;
        end
    end

endmodule