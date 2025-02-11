
### eu_pkg package - input for eu

| field name | type | width | comment |
|------------|------|-------|---------|
| inst_pld | logic | INST_WIDTH | instruction payload |
| inst_id | logic | INST_IDX_WIDTH | commit id |
| arch_reg_index | logic | 5 | rename table reg index |
| inst_rd | logic | PHY_REG_ID_WIDTH | phy reg rd index |
| inst_rd_en | logic | 1 | phy int reg rd en |
| inst_fp_rd_en | logic | 1 | phy fp reg rd en |
| c_ext | logic | 1 | c ext flag |
| inst_pc | logic | ADDR_WIDTH | instrction pc |
| reg_rs1_val | logic | 32 | rs1 value |
| reg_rs2_val | logic | 32 | rs2 value |
| reg_rs3_val | logic | 32 | rs3 value |
| inst_imm | logic | 32 | immediately data |
| lsu_id | logic | LSU_DEPTH_WIDTH+1 | lsu buffer id,lsu only |
| eu_bp_pld | package | eu_bp_pkg | bp package,alu only |
| fwd_pld | package | fwd_pkg | forward package |

### fwd_pkg package - forward input,include in eu_pkg

| field name | type | width | comment |
|------------|------|-------|---------|
| rs1_forward_cycle | logic | FORWARD_NUM | rs1 forward cycle |
| rs2_forward_cycle | logic | FORWARD_NUM | rs2 forward cycle |
| rs3_forward_cycle | logic | FORWARD_NUM | rs3 forward cycle |
| rs1_forward_id | logic | EU_NUM_WIDTH | rs1 forward id |
| rs2_forward_id | logic | EU_NUM_WIDTH | rs2 forward id |
| rs3_forward_id | logic | EU_NUM_WIDTH | rs3 forward id |

### eu_bp_pkg package - for alu&csr bp input,include in eu_pkg

| field name | type | width | comment |
|------------|------|-------|---------|
| pred_pc | logic | ADDR_WIDTH | bp pred pc, block first pc|
| tgt_pc | logic | ADDR_WIDTH | bp target pc |
| is_last | logic | 1 | block last |
| is_cext | logic | 1 | cext flag |
| carry | logic | 1 | low/high 16bit |
| offset | logic | BPU_OFFSET_WIDTH | bp offset |

### commit_bp_branch_pkg package - alu&decode create

| field name | type | width | comment |
|------------|------|-------|---------|
| inst_nxt_pc | logic | ADDR_WIDTH | real pc |
| commit_error | logic | 1 | target_pc != nxt_pc |
| taken | logic | 1 | jump flag |
| is_last | logic | 1 | last flag |
| taken_err | logic | 1 | err flag |
| taken_pend | logic | 1 | last flag |

### bp_bypass_pkg package  - create by bp,input for decode

| field name | type | width | comment |
|------------|------|-------|---------|
| tgt_pc | logic | ADDR_WIDTH | bp target pc |
| pred_pc | logic | ADDR_WIDTH | bp perd pc |
| is_last | logic | 1 |  |
| taken | logic | 1 |  |

### decode_commit_bp_pkg package  , decode create for bp commit

| field name | type | width | comment |
|------------|------|-------|---------|
| inst_id | logic | INST_IDX_WIDTH |  |
| commit_common_pld  | package | commit_common_pkg | common bp  |
| commit_bp_branch_pld  | package | commit_bp_branch_pkg     |  |
| fp_commit_en | logic | 1 | only fp == 1 |
| store_commit_en | logic | 1 | only store == 1 |

### commit_common_pkg package  , decode create

| field name | type | width | comment |
|------------|------|-------|---------|
| is_cext | logic | 1 | decode |
| is_call | logic | 1 | instruction decode |
| is_ret | logic | 1 | instruction decode |
| offset | logic | BPU_OFFSET_WIDTH | current_pc - pred_pc |
| pred_pc | logic | ADDR_WIDTH | block first pc |
| carry | logic | 1 | cext decode |
| rd_en | logic | 1 |  |
| fp_rd_en | logic | 1 |  |
| arch_reg_index | logic | 5 |  |
| phy_reg_index | logic | PHY_REG_ID_WIDTH |  |
| inst_pc | logic | ADDR_WIDTH | only for debug |
| inst_val | logic | INST_WIDTH_32 | only for debug |

## fp_commit_pkg package - only fp create

| field name | type | width | comment |
|------------|------|-------|---------|
| FCSR_en | logic | 8 |  |
| FCSR_data | logic | 8 |  |

## stq_commit_pkg package - only stq create

| field name | type | width | comment |
|------------|------|-------|---------|
| stq_commit_entry_en | logic | 1 |  |
| stq_commit_entry | logic | $clog2(STU_DEPTH) |  |


## fe_bp_pkg package - fe create for decode

| field name | type | width | comment |
|------------|------|-------|---------|
| pred_pc | logic | ADDR_WIDTH |  |
| tgt_pc | logic | ADDR_WIDTH |  |
| is_last | logic | 1 |  |
| taken | logic | 1 |  |

## fe_bp_pkg package - be create for bp

| field name | type | width | comment |
|------------|------|-------|---------|
| current_pc | logic | ADDR_WIDTH |  |
| real_nxt_pc | logic | ADDR_WIDTH |  |
| offset | logic | BPU_OFFSET_WIDTH |  |
| is_call | logic | 1 |  |
| is_ret | logic | 1 |  |
| taken_err | logic | 1 |  |
| taken_pend | logic | 1 |  |
| is_last | logic | 1 |  |
| c_ext | logic | 1 |  |
| carry | logic | 1 |  |
| taken | logic | 1 |  |


