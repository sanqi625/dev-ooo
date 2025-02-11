### toy_csr

| Port Name            | Type    | I/O    | Width            | Comment |
|----------------------|---------|--------|------------------|--|
| clk                  | logic   | input  | 1                |  |
| rst_n                | logic   | input  | 1                |  |
| intr_instruction_vld | logic   | output | 1                |  |
| intr_instruction_rdy | logic   | input  | 1                |  |
| instruction_en       | logic   | input  | 1                |  |
| instruction_pld      | package | input  | eu_pkg           |  |
| instruction_is_intr  | logic   | input  | 1                |  |
| reg_index            | logic   | output | PHY_REG_ID_WIDTH |  |
| reg_wr_en            | logic   | output | 1                |  |
| reg_val              | logic   | output | REG_WIDTH        |  |
| csr_commit_en        | logic   | output | 1                |  |
| csr_commit_id        | logic   | output | INST_IDX_WIDTH       |  |
| csr_commit_pld       | package | output | commit_bp_branch_pkg       |  |
| csr_INSTRET          | logic   | input  | 64               |  |
| csr_FCSR             | logic   | output | 32               |  |
| csr_FFLAGS           | logic   | input  | 5                |  |
| csr_FFLAGS_en        | logic   | input  | 1                |  |
| cancel_edge_en       | logic   | input  | 1                |  |
| FCSR_backup          | logic   | input  | 8                |  |
| pc_release_en        | logic   | output | 1                |  |
| pc_update_en         | logic   | output | 1                |  |
| pc_val               | logic   | output | ADDR_WIDTH       |  |
| intr_meip            | logic   | input  | 1                |  |
| intr_msip            | logic   | input  | 1                |  |
