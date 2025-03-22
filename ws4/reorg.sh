#!/bin/bash

# reorg.sh: Reorganizes 2019 taxi datasets by vendorid

# Get current timestamp for file naming
timestamp=$(date "+%F-%T")
input_file="./2019-01-h1.csv"

# Create CSV filenames with timestamp
declare -A vendors=( ["1.0"]="1.0" ["2.0"]="2.0" ["4.0"]="4.0" )

# Initialize empty files
for key in "${!vendors[@]}"; do
    files["$key"]="${timestamp}-${vendors[$key]}.csv"
    touch "${files[$key]}"
done

# Fill CSV files with filtered data (excluding header)
for key in "${!vendors[@]}"; do
    tail -n +2 "$input_file" | grep "^${key}[,.]" > "${files[$key]}"
done

# Add CSV files to .gitignore
for key in "${!vendors[@]}"; do
    echo "${files[$key]}" >> .gitignore
done

# Store wc -l results in ws4.txt
echo "File Line Counts:" > ws4.txt
for key in "${!vendors[@]}"; do
    echo "$(wc -l < "${files[$key]}") ${files[$key]}" >> ws4.txt
done

# Append .gitignore contents to ws4.txt
echo -e "\n.gitignore contents:" >> ws4.txt
cat .gitignore >> ws4.txt
