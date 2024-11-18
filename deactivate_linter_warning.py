#!/usr/bin/env python
import sys
from pathlib import Path

if len(sys.argv) < 4:
    print('Usage: python deactivate_linter_warning.py <base_directory> <file_pattern> <warning>')
    print("Example: ./deactivate_linter_warning.py verilog/rtl/Tile \"**/OD*.v:\" UNUSEDSIGNAL")
    sys.exit(1)

def find_files(base_dir, pattern):
    return list(Path(base_dir).rglob(pattern))

def deactivate_warning(file_path, warning):

    lines = Path(file_path).read_text().splitlines()
    if not lines:
        print(f"File {file_path} is empty")
        return
    if warning in " ".join(lines):
        print(f"Warning {warning} already deactivated in {file_path}")
        return

    if len(lines) > 1:
        lines[1] += f"\n/* verilator lint_off {warning} */\n"
        lines[-1] += f"\n/* verilator lint_on {warning} */\n"
    Path(file_path).write_text('\n'.join(lines) + '\n')

base_directory = sys.argv[1]
file_pattern = sys.argv[2]
warning = sys.argv[3]
files = find_files(base_directory, file_pattern)

if not files:
    print(f"No files found in {base_directory} with pattern {file_pattern}")
    sys.exit(1)

for file in files:
    deactivate_warning(file, warning)
    print(f"Deactivated warning {warning} in {file}")

print("Deactivated warning {warning} in {len(files)} files")

