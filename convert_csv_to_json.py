import json
import ast
import pandas as pd

import sys

# Check if at least one command-line argument is provided
if len(sys.argv) < 2:
    print("Usage: python script.py <src_file.csv> <dest_file.json>")
    exit(0)

# Access the command-line arguments starting from index 1 (0 is the script name)
src_file, dst_file = sys.argv[1:3]

# Print the arguments
print(f"Command-line arguments: {src_file} {dst_file}")

df = pd.read_csv(src_file)

levels = df['level']
json_levels = levels.apply(lambda x: ast.literal_eval(x))
json_levels = json_levels.to_list()

# Save the JSON data to the file
with open(dst_file, 'w') as file:
    json.dump(json_levels, file)

print(f'Saved {dst_file}')