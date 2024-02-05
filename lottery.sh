#!/bin/bash

date_string=$(date +"%Y-%m-%d")
filename="lottery_numbers_${date_string}.txt"


main_numbers=($(awk 'NR==1 {print $0}' $filename)) 
bonus_ball=$(awk 'NR==2 {print $0}' $filename) 

read -p "Enter your 5 lottery numbers separated by spaces: " -a user_numbers
read -p "Enter your bonus ball number: " user_bonus_ball


main_matches=($(echo ${main_numbers[@]} ${user_numbers[@]} | tr ' ' '\n' | sort | uniq -d | tr '\n' ' ')) #store result into array with space between elements, sorting, -d for only print duplicate lines and turncate newline with space
bonus_match=$((bonus_ball == user_bonus_ball))

echo "Main Number Matches: ${main_matches[@]}"
echo "Bonus Ball Match: $bonus_match"
echo "Total Matches: $((${#main_matches[@]} + bonus_match))"
