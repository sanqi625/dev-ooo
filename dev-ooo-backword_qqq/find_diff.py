import re
import argparse

def find_first_difference(file1, file2=None, mode=1, pc_value=None):
    if mode == 4 and not pc_value:
        print("Mode 4 requires a 'pc' value to search for.")
        return

    if mode != 4 and not file2:
        print("This mode requires two files for comparison.")
        return

    if mode == 4:
        with open(file1, 'r') as f:
            pattern = rf'\[pc={pc_value}\]\[inst=(.*?)\]'
            found = False
            for line_num, line in enumerate(f, 1):
                match = re.search(pattern, line)
                if match:
                    print(f"Line {line_num}: inst value = {match.group(1)}")
                    found = True
            if not found:
                print(f"No entries found with pc={pc_value}.")
        return

    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        for line_num, (line1, line2) in enumerate(zip(f1, f2), 1):
            if mode == 1:
                if line1 != line2:
                    print(f"First difference at line {line_num}:\nFile1: {line1}File2: {line2}")
                    return
            elif mode == 2:
                pattern = r'\[.*?\]\[.*?\]'
                part1 = re.search(pattern, line1)
                part2 = re.search(pattern, line2)
                if part1 and part2 and part1.group() != part2.group():
                    print(f"First difference at line {line_num}:\nFile1: {line1}File2: {line2}")
                    return
            elif mode == 3:
                parts1 = re.findall(r'\[.*?\]', line1)
                parts2 = re.findall(r'\[.*?\]', line2)
                if len(parts1) >= 3 and len(parts2) >= 3:
                    if parts1[0] != parts2[0] or parts1[2] != parts2[2]:
                        if parts1[2] != parts2[2]:
                            data1 = parts1[2][1:-1].split()
                            data2 = parts2[2][1:-1].split()
                            for idx, (d1, d2) in enumerate(zip(data1, data2)):
                                if d1 != d2:
                                    print(f"First difference at line {line_num}:\n"
                                          f"File1: {line1}File2: {line2}"
                                          f"Difference found at item {idx:02}: {d1} vs {d2}")
                                    return
                        else:
                            print(f"First difference at line {line_num}:\nFile1: {line1}File2: {line2}")
                            return
        print("No differences found.")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Compare two files or search for 'inst' values by 'pc'.")
    parser.add_argument("file1", type=str, help="Path to the first file")
    parser.add_argument("file2", nargs='?', type=str, help="Path to the second file (only for modes 1-3)")
    parser.add_argument("mode", type=int, choices=[1, 2, 3, 4], help="Comparison mode: 1 for full line, 2 for first two brackets, 3 for first and third brackets, 4 to find 'inst' by 'pc'")
    parser.add_argument("--pc_value", type=str, help="Specify pc value for mode 4")

    args = parser.parse_args()
    find_first_difference(args.file1, args.file2, args.mode, args.pc_value)
