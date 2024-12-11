def generate_case_statements(case_expr, mode, output_file):
    case_block = f"    case ({case_expr})\n"
    for i in range(16):
        binary_case = f"4'b{format(i, '04b')}"
        ones_indices = [j for j in range(4) if (i >> j) & 1]
        ones_count = len(ones_indices)
        case_block += f"        {binary_case}: begin\n"

        if mode == 1:
            for j in range(4):
                if j + ones_count < 4:
                    case_block += f"            v_out_index[{j}]   <= v_out_index[{j + ones_count}]    ;\n"
                else:
                    case_block += f"            v_out_index[{j}]   <= v_rd_index[{j + ones_count - 4}]     ;\n"
            for j in range(4):
                if j + ones_count < 4:
                    case_block += f"            v_rd_index_en[{j}] <= v_rd_index_en[{j + ones_count}]  ;\n"
                else:
                    case_block += f"            v_rd_index_en[{j}] <= v_rd_ptr_add_en[{j + ones_count - 4}];\n"
        elif mode == 2:
            case_block += f"            rd_ptr_nxt = rd_ptr_add[{ones_count}] ;\n"
        elif mode == 3:
            for idx, one_pos in enumerate(ones_indices):
                case_block += f"            v_fifo_pld[end_ptr_add[{idx}]] <= v_out_index[{one_pos}] ;\n"
            case_block += f"            end_ptr <= end_ptr_add[{ones_count}] ;\n"

        case_block += "        end\n"
    case_block += "    endcase\n"

    with open(output_file, "w") as f:
        f.write(case_block)

for mode in range(1, 4):
    output_file = f"case_gen_mode_{mode}.sv"
    generate_case_statements("case_signal", mode, output_file)

print("Case statements have been generated for modes 1, 2, and 3.")
