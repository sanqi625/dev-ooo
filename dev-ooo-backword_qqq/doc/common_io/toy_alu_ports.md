# toy_alu

| Port Name       | Type    | I/O    | Width            | Comment |
|-----------------|---------|--------|------------------|--|
| clk             | logic   | input  | 1                |clock  |
| rst_n           | logic   | input  | 1                |reset  |
| instruction_en  | logic   | input  | 1                |input enable  |
| instruction_pld | package | input  | eu_pkg           |input payload  |
| reg_wr_en       | logic   | output | 1                |physical rd valid  |
| reg_index       | logic   | output | PHY_REG_ID_WIDTH |physical rd index  |
| reg_data        | logic   | output | REG_WIDTH        |physical rd data  |
| inst_commit_en  | logic   | output | 1                |commit enable  |
| inst_id         | logic   | output |INST_IDX_WIDTH    |  |
| alu_commit_bp_pld|package | output | commit_bp_branch_pkg| bp commit payload  |
