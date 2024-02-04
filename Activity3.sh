#!/bin/bash

current_date=$(date +"%Y-%m-%d")

file_name="lottery_numbers_$current_date.txt"

numbers=$(shuf -i 1-50 -n 5) > "$file_name"

bonus_ball=$(shuf -i 1-10 -n 1)
echo "Bonus Ball: $bonus_ball" >> "$file_name"

echo "Lottery numbers generated and saved to $file_name"
