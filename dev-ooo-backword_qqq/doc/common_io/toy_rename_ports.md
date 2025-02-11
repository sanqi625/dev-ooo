### toy_rename

| Port Name                          | Type    | I/O    | Width            | Comment |
|------------------------------------|---------|--------|------------------|--|
| clk                                | logic   | input  | 1                |  |
| rst_n                              | logic   | input  | 1                |  |
| v_pre_allocate_int_vld             | logic   | input  | INST_DECODE_NUM  |  |
| v_pre_allocate_int_rdy_withoutzero | logic   | output | INST_DECODE_NUM  |  |
| v_pre_allocate_int_id              | logic   | input  | PHY_REG_ID_WIDTH |  |
| v_pre_allocate_fp_vld              | logic   | input  | INST_DECODE_NUM  |  |
| v_pre_allocate_fp_rdy              | logic   | output | INST_DECODE_NUM  |  |
| v_pre_allocate_fp_id               | logic   | input  | PHY_REG_ID_WIDTH |  |
| v_decode_vld                       | logic   | input  | INST_DECODE_NUM  |  |
| v_decode_rdy                       | logic   | output | INST_DECODE_NUM  |  |
| v_decode_pld                       | package | input  | decode_pkg       |  |
| cancel_en                          | logic   | input  | 1                |  |
| cancel_edge_en_d                   | logic   | input  | 1                |  |
| v_int_backup_phy_id                | logic   | input  | PHY_REG_ID_WIDTH |  |
| v_fp_backup_phy_id                 | logic   | input  | PHY_REG_ID_WIDTH |  |
| v_rename_vld                       | logic   | output | INST_DECODE_NUM  |  |
| v_rename_rdy                       | logic   | input  | INST_DECODE_NUM  |  |
| v_rename_pld                       | package | output | rename_pkg       |  |
| v_decode_commit_bp_pld             | package | output | decode_commit_bp_pkg|  |
