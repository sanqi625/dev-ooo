### toy_float_wrapper

| Port Name                  | Type    | I/O    | Width            | Comment |
|----------------------------|---------|--------|------------------|--|
| clk                        | logic   | input  | 1                |  |
| rst_n                      | logic   | input  | 1                |  |
| instruction_vld            | logic   | input  | 1                |  |
| instruction_rdy            | logic   | output | 1                |  |
| instruction_pld            | package | input  | eu_pkg           |  |
| csr_FCSR                   | logic   | input  | 32               |  |
| csr_FFLAGS_en              | logic   | output | 1                |  |
| csr_FFLAGS                 | logic   | output | 5                |  |
| float_fp_reg_wr_forward_en | logic   | output | 1                |  |
| float_reg_wr_forward_en    | logic   | output | 1                |  |
| fp_reg_forward_index       | logic   | output | PHY_REG_ID_WIDTH |  |
| reg_index                  | logic   | output | PHY_REG_ID_WIDTH |  |
| reg_wr_en                  | logic   | output | 1                |  |
| reg_val                    | logic   | output | REG_WIDTH        |  |
| fp_reg_wr_en               | logic   | output | 1                |  |
| fp_commit_en               | logic   | output | 1                |  |
| fp_commit_id               | logic   | output | INST_IDX_WIDTH   |  |
| fp_commit_pld              | package | output | fp_commit_pkg    |  |
