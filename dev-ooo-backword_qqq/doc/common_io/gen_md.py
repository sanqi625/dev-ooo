import re
import argparse
import os

def parse_system_verilog(file_path):
    ports = []
    with open(file_path, 'r') as file:
        lines = file.readlines()
    # 正则表达式用于匹配端口声明
    port_pattern = re.compile(r'^\s*(input|output|inout)\s+(logic|[\w:]+)\s*(\[\s*\$?[\w|\d]+[\w\(\)]*\s*(-\d+)?\s*:\s*\d+\s*\]|\s*)?\s*([\w\d_]+)(\s*#\((.*?)\))?\s*')
    width_pattern = re.compile(r'\[\s*(\$?[\w|\d]+[\w\(\)]*)\s*(-\d+)?\s*:\s*\d+\s*\]')  # 匹配位宽范围 [AAA-1:0]
    for line in lines:
        match = port_pattern.search(line)
        if match:
            io_type = match.group(1)
            port_type = match.group(2) 
            port_name = match.group(5)
            width_param = match.group(3) if match.group(3) else 'unsized'
            
            # 处理 package 类型的特殊情况
            if not "logic" in port_type:
                # Type 设置为 'package'，Width 设置为 package 的名字
                ports.append([port_name, "package", io_type, port_type, ""])
            else:
                # 处理位宽
                width = '1'  # 默认值，表示无位宽时为1
                width_match = width_pattern.search(line)
                if width_match:
                    if (width_match.group(2) == "-1"):
                        width = width_match.group(1)
                    else :
                        if width_match.group(1).isdigit():
                            width = str(int(width_match.group(1))+1)
                        else :
                            width = f"{width_match.group(1)}+1"
                elif width_param != 'unsized':
                    # 如果是参数化的位宽，直接用参数名
                    width = width_param
                
                ports.append([port_name, port_type, io_type, width, ""])

    return ports

def save_to_markdown(ports, output_file, text_title):
    with open(output_file, 'w') as md_file:
        md_file.write(f"### {text_title}\n\n")
        # 计算列宽，以确保对齐
        max_widths = {
            "Port Name": max(len(port[0]) for port in ports),
            "Type": max(len(port[1]) for port in ports),
            "I/O": max(len(port[2]) for port in ports),
            "Width": max(len(port[3]) for port in ports),
            "Comment": max(len(port[4]) for port in ports),
        }

        # 表头
        md_file.write(f"| {'Port Name':<{max_widths['Port Name']}} | {'Type':<{max_widths['Type']}} | {'I/O':<{max_widths['I/O']}} | {'Width':<{max_widths['Width']}} | {'Comment':<{max_widths['Comment']}} |\n")
        md_file.write(f"|{'-' * (max_widths['Port Name'] + 2)}|{'-' * (max_widths['Type'] + 2)}|{'-' * (max_widths['I/O'] + 2)}|{'-' * (max_widths['Width'] + 2)}|{'-' * (max_widths['Comment'] + 2)}|\n")
        
        # 表格内容
        for port in ports:
            port_name, port_type, io_type, width, Comment = port
            md_file.write(f"| {port_name:<{max_widths['Port Name']}} | {port_type:<{max_widths['Type']}} | {io_type:<{max_widths['I/O']}} | {width:<{max_widths['Width']}} | {Comment:<{max_widths['Comment']}} |\n")
    
    print(f"Markdown file saved to {output_file}")

def main():
    parser = argparse.ArgumentParser(description="Generate a Markdown file from a SystemVerilog file.")
    parser.add_argument('file', type=str, help="The path to the SystemVerilog file.")
    
    args = parser.parse_args()
    
    if not os.path.isfile(args.file):
        print(f"Error: The file '{args.file}' does not exist.")
        return
    
    # 使用输入文件名生成输出Markdown文件名
    output_file = f"{os.path.splitext(args.file)[0]}_ports.md"
    text_title_all = f"{os.path.splitext(args.file)[0]}"
    text_title = re.search(r'([^/]+)$', text_title_all)
    ports = parse_system_verilog(args.file)
    save_to_markdown(ports, output_file, text_title[0])

if __name__ == "__main__":
    main()
