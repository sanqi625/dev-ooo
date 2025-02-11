import os

def find_sv_v_files(directory, output_file='filelist.f'):
    # 打开输出文件
    with open(output_file, 'w') as f_out:
        # 遍历给定目录及其子目录
        for root, dirs, files in os.walk(directory):
            # 查找后缀为 .sv 或 .v 的文件
            for file in files:
                if file.endswith('.sv') or file.endswith('.v'):
                    # 将文件的完整路径写入输出文件
                    full_path = os.path.join(root, file)
                    f_out.write(full_path + '\n')

# 使用方法
directory_to_search = '/data/usr/hurj/ooo/toy_scalar/rtl/core'  # 替换为实际目录路径
find_sv_v_files(directory_to_search)
