### toy_commit

| Port Name             | Type    | I/O    | Width              | Comment |
|-----------------------|---------|--------|--------------------|--|
| clk                   | logic   | input  | 1                  |  |
| rst_n                 | logic   | input  | 1                  |  |
| v_alu_commit_en       | logic   | input  | INST_ALU_NUM       |  |
| v_alu_commit_id       | logic   | input  | INST_IDX_WIDTH*INST_ALU_NUM    |  |
| v_alu_commit_pld      | package | input  | commit_bp_branch_pkg*INST_ALU_NUM         |  |
| v_st_ack_commit_en    | logic   | output | 4                  |  |
| v_st_ack_commit_entry | logic   | output | $clog2(STU_DEPTH)*4  |  |
| stq_commit_en         | logic   | input  | 1                  |  |
| stq_commit_id         | logic   | input  | INST_IDX_WIDTH     |  |
| stq_commit_pld        | package | input  | stq_commit_pkg     |  |
| v_ld_commit_en        | logic   | input  | 2                  |  |
| v_ld_commit_id        | logic   | input  | INST_IDX_WIDTH*2     |  |
| fp_commit_en          | logic   | input  | 1                  |  |
| fp_commit_id          | logic   | input  | INST_IDX_WIDTH     |  |
| fp_commit_pld         | package | input  | fp_commit_pkg      |  |
| mext_commit_en        | logic   | input  | 1                  |  |
| mext_commit_id        | logic   | input  | INST_IDX_WIDTH     |  |
| csr_commit_en         | logic   | input  | 1                  |  |
| csr_commit_id         | logic   | input  | INST_IDX_WIDTH     |  |
| csr_commit_pld        | package | input  | commit_bp_branch_pkg         |  |
| v_rename_en     | logic   | input  | INST_DECODE_NUM  |  |
| v_commit_rename_pld         | package | input  | decode_commit_bp_pkg*INST_DECODE_NUM      |  |
| cancel_en             | logic   | output | 1                  |  |
| cancel_edge_en        | logic   | output | 1                  |  |
| cancel_edge_en_d      | logic   | output | 1                  |  |
| FCSR_backup           | logic   | output | 8                  |  |
| v_rf_commit_en        | logic   | output | COMMIT_REL_CHANNEL |  |
| v_rf_commit_pld       | package | output | commit_pkg*COMMIT_REL_CHANNEL         |  |
| v_commit_error_en     | logic   | output | COMMIT_REL_CHANNEL |  |
| v_bp_commit_pld       | package | output | be_pkg*COMMIT_REL_CHANNEL             |  |
| csr_INSTRET           | logic   | output | 64                 |  |
| commit_credit_rel_en  | logic   | output | 1                  |  |
| commit_credit_rel_num | logic   | output | 3                  |  |
