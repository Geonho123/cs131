#!/bin/bash

# reorg.sh: Reorganizes 2019 taxi datasets by vendorid

# Get current timestamp for file naming
timestamp=$(date "+%F-%T")
input_file="./2019-01-h1.csv"

# Create CSV filenames with timestamp
file1="${timestamp}-1.0.csv"
file2="${timestamp}-2.0.csv"
file3="${timestamp}-4.0.csv"

# Initialize empty files
touch "$file1" "$file2" "$file3"

# Fill CSV files with filtered data (excluding header)
tail -n +2 "$input_file" | grep "^1.0," > "$file1"
tail -n +2 "$input_file" | grep "^2.0," > "$file2"
tail -n +2 "$input_file" | grep "^4.0," > "$file3"


# Add CSV files to .gitignore
echo "$file1" >> .gitignore
echo "$file2" >> .gitignore
echo "$file3" >> .gitignore

