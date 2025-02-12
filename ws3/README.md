# CS131 Worksheet 3  

This repository contains the worksheet 3 submission for CS131.  

## Files Included  

- **ws3.txt**: Contains the extracted and processed data from `2019-01-h1.csv`, including the top 3 pickup locations on selected dates.  
- **cmds.log**: A log file capturing all the command history used to process the dataset.  

## Data Processing Steps  

1. Used `grep` to filter records for specific dates.  
2. Extracted the pickup location IDs using `cut`.  
3. Sorted and counted occurrences using `sort` and `uniq -c`.  
4. Retrieved the top 3 most frequent pickup locations using `sort -nr | head -3`.  
5. Saved the outputs in `ws3.txt` and logged the command history in `cmds.log`.  

## Important Notes  

🚨 **DO NOT COMMIT/PUSH the original dataset (`2019-01-h1.csv`).**  
🚨 **Only `ws3.txt` and `cmds.log` should be submitted.**  

