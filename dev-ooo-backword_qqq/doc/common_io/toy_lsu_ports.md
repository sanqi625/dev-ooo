### toy_lsu

| Port Name             | Type    | I/O    | Width               | Comment |
|-----------------------|---------|--------|---------------------|--|
| clk                   | logic   | input  | 1                   |  |
| rst_n                 | logic   | input  | 1                   |  |
| v_instruction_en      | logic   | input  | 4                   |  |
| v_lsu_pld             | package | input  | eu_pkg*4            |  |  
| v_lsu_stu_en          | logic   | input  | 4                   |  |
| lsu_buffer_rd_ptr     | logic   | output | $clog2(LSU_DEPTH)+1 |  |
| v_forward_data        | logic   | input  | REG_WIDTH*EU_NUM    |  |
| reg_index             | logic   | output | PHY_REG_ID_WIDTH*3  |  |
| reg_wr_en             | logic   | output | 3                   |  |
| reg_val               | logic   | output | REG_WIDTH*3         |  |
| fp_reg_wr_en          | logic   | output | 3                   |  |  
| v_st_ack_commit_en    | logic   | input  | 4                   |  |
| v_st_ack_commit_entry | logic   | input  | $clog2(STU_DEPTH)*4 |  |
| forward_dtcm_int_en   | logic   | output | 1                   |  |
| forward_dtcm_fp_en    | logic   | output | 1                   |  |
| forward_dtcm_phy_id   | logic   | output | PHY_REG_ID_WIDTH    |  |
| stq_commit_en         | logic   | output | 1                   |  |
| stq_commit_id         | logic   | output | INST_IDX_WIDTH      |  |
| v_ld_commit_en        | logic   | output | 2                   |  |
| v_ld_commit_id        | logic   | output | INST_IDX_WIDTH*2    |  |
| cancel_en             | logic   | input  | 1                   |  |
| cancel_edge_en        | logic   | input  | 1                   |  |
| mem_req_vld           | logic   | output | 1                   |  |
| mem_req_rdy           | logic   | input  | 1                   |  |
| mem_req_addr          | logic   | output | ADDR_WIDTH          |  |
| mem_req_data          | logic   | output | DATA_WIDTH          |  |
| mem_req_strb          | logic   | output | DATA_WIDTH/8        |  |
| mem_req_opcode        | logic   | output | 1                   |  |
| mem_req_sideband      | logic   | output | FETCH_SB_WIDTH      |  |
| mem_ack_sideband      | logic   | input  | FETCH_SB_WIDTH      |  |
| mem_ack_vld           | logic   | input  | 1                   |  |
| mem_ack_rdy           | logic   | output | 1                   |  |
| mem_ack_data          | logic   | input  | DATA_WIDTH          |  |
