### toy_mext

| Port Name               | Type    | I/O    | Width            | Comment |
|-------------------------|---------|--------|------------------|--|
| clk                     | logic   | input  | 1                |  |
| rst_n                   | logic   | input  | 1                |  |
| instruction_vld         | logic   | input  | 1                |  |
| instruction_rdy         | logic   | output | 1                |  |
| instruction_pld         | package | input  | eu_pkg           |  |
| instruction_forward_rdy | logic   | output | 1                |  |
| cancel_en               | logic   | input  | 1                |  |
| mext_reg_wr_forward_en  | logic   | output | 1                |  |
| mext_reg_forward_index  | logic   | output | PHY_REG_ID_WIDTH |  |
| reg_index               | logic   | output | PHY_REG_ID_WIDTH |  |
| reg_wr_en               | logic   | output | 1                |  |
| reg_val                 | logic   | output | REG_WIDTH        |  |
| mext_commit_en          | logic   | output | 1                |  |
| mext_commit_id          | logic   | output | INST_IDX_WIDTH   |  |
