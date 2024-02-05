#!/bin/bash
main_numbers=$(shuf -i 1-50 -n 5 | tr '\n' ' ') #shuffle no between 1 to 50, take 5 numbers and turncate new line with sapce
bonus_ball=$(shuf -i 1-10 -n 1)  #shuffle no between 1 to 10, take 1 numbers
date_string=$(date +"%Y-%m-%d")
filename="lottery_numbers_${date_string}.txt"

echo "$main_numbers" > "$filename"
echo "$bonus_ball" >> "$filename"

echo "Lottery numbers $main_numbers and Bonus Ball $bonus_ball generated and saved to $filename."

