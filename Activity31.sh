#!/bin/bash

# Ask the user to enter lottery numbers and bonus ball
read -p "Enter your 5 lottery numbers (space-separated): " -a user_numbers
read -p "Enter the bonus ball number: " user_bonus_ball

# Get the latest generated lottery numbers file
latest_file=$(ls -t lottery_numbers_*.txt 2>/dev/null | head -n 1)

# Exit if no file is found
[ -z "$latest_file" ] && { echo "No lottery numbers file found."; exit 1; }

# Extract lottery numbers and bonus ball from the file
source "$latest_file"

# Compare user numbers with generated numbers
matched_numbers=0
for num in ${user_numbers[@]}; do
for gen_num in ${lottery_numbers[@]}; do
if [ "$num" == "$gen_num" ]; then
((matched_numbers++))
break
fi
done
done

# Check the bonus ball
bonus_matched="Bonus ball $(($user_bonus_ball == $bonus_ball))"

# Display the results
echo -e "\nResults:"
echo "Your Numbers: ${user_numbers[*]}"
echo "Generated Numbers: ${lottery_numbers[*]}"
echo "Your Bonus Ball: $user_bonus_ball"
echo "Generated Bonus Ball: $bonus_ball"
echo "Matches: $matched_numbers"
echo "$bonus_matched"
