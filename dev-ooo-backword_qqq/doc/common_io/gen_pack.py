import re
import os
import argparse

def extract_package_fields(package_definition):

    fields = []
    
    # 正则表达式匹配包中的字段
    # pattern = r'(\w+\s*\[\s*\w*\s*:\s*\w*\s*\]?\s*\w+)\s*;'
    port_pattern = re.compile(r'\s*(logic|[\w:]+)\s*(\[\s*[\w|\d]+(-\d+)?\s*:\s*\d+\s*\]|\s*)?\s*([\w\d_]+)(\s*#\((.*?)\))?\s*')
    width_pattern = re.compile(r'\[\s*([\w|\d]+)(-\d+)?\s*:\s*\d+\s*\]')  # 匹配位宽范围 [AAA-1:0]
    # print(package_definition)
    for line in package_definition.split("\n"):
        port_matches = port_pattern.search(line)
        # width_matches = width_pattern.search(line)
        if port_matches:
            port_type = port_matches.group(1) 
            port_name = port_matches.group(4)
            if port_name=="c":
                print(line)
            width_param = port_matches.group(2) if port_matches.group(2) else 'unsized'
            if not "logic" in port_type:
                fields.append([port_name, "package", port_type, ""])
            else:
                # 处理位宽
                width = '1'  # 默认值，表示无位宽时为1
                width_match = width_pattern.search(line)
                if width_match:
                    if (width_match.group(2) == "-1"):
                        width = width_match.group(1)
                    else :
                        if width_match.group(1).isdigit():
                            width = int(width_match.group(1))+1
                        else :
                            width = f"{width_match.group(1)}+1"

                elif width_param != 'unsized':
                    width = width_param
                
                fields.append([port_name, port_type, width, ""])
  
        
    return fields

def generate_package_table(package_file, output_md_file):

    def parse_package_file(package_file):

        packages = []
        with open(package_file, 'r') as f:
            content = f.read()
        
        # 正则表达式匹配包定义
        pattern = r'typedef\s+struct\s+packed\s*\{([^}]+)\}\s+(\w+)\s*;'
        matches = re.findall(pattern, content, re.DOTALL)
        for package_definition, package_name in matches:
            fields = extract_package_fields(package_definition)
            packages.append({
                'package_name': package_name,
                'fields': fields
            })
        
        return packages

    def generate_markdown_table(package_info):

        md_content = ""
        
        for package in package_info:
            md_content += f"### {package['package_name']} package\n\n"
            table_header = "| field name | type | width | comment |"
            table_separator = "|------------|------|-------|---------|"
            table_rows = []

            for field in package['fields']:
                port_name, port_type, width, Comment = field
                row = (f"| {port_name} | {port_type} | {width} | {Comment} |")
                table_rows.append(row)

            md_content += "\n".join([table_header, table_separator] + table_rows) + "\n\n"
        
        return md_content

    # 解析包文件
    package_info = parse_package_file(package_file)

    # 生成 Markdown 格式内容
    md_content = generate_markdown_table(package_info)

    # 写入输出文件
    with open(output_md_file, 'w') as md_file:
        md_file.write(md_content)
    print(f"Markdown file generated: {output_md_file}")


# generate_package_table("/data/usr/hurj/merge/toy_scalar/rtl/toy_pack.sv","/data/usr/hurj/merge/toy_scalar/rtl/toy_pack.md")
def main():
    parser = argparse.ArgumentParser(description="Generate a Markdown file from a SystemVerilog file.")
    parser.add_argument('file', type=str, help="The path to the SystemVerilog file.")
    
    args = parser.parse_args()
    
    if not os.path.isfile(args.file):
        print(f"Error: The file '{args.file}' does not exist.")
        return
    
    # 使用输入文件名生成输出Markdown文件名
    output_file = f"{os.path.splitext(args.file)[0]}_pack.md"
    generate_package_table(args.file, output_file)  

if __name__ == "__main__":
    main()
