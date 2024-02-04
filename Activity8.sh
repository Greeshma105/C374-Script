#!/bin/bash

calculate() {
    product=1
    sum=0
    min=${numbers[0]}
    max=${numbers[0]}

    for number in "${numbers[@]}"; do
        product=$((product * number))
        sum=$((sum + number))

        if ((number < min)); then
            min=$number
        fi

        if ((number > max)); then
            max=$number
        fi
    done

    average=$((sum / ${#numbers[@]}))
}

echo "Enter the numbers. Minimum=5 & maximum=10. Please enter 'stop' to finish."

count=0
while true; do
    read -p "Enter a number: " input

    if [[ "$input" == "stop" ]]; then
        break
    fi

    if [[ "$input" =~ ^[0-9]+$ ]]; then
        numbers+=("$input")
        ((count++))

        if ((count == 10)); then
            break
        elif ((count >= 5)); then
            read -p "Do you want to enter another number? (yes/no): " continue

            if [[ "$continue" != "yes" ]]; then
                break
            fi
        fi
    else
        echo "Invalid input. Please enter a valid integer or 'stop'."
    fi
done

calculate

echo -e "\nValues entered by the user: ${numbers[@]}"
echo "Product of integers: $product"
echo "Average of integers: $average"
echo "Sum of integers: $sum"
echo "Min of integers: $min"
echo "Max of integers: $max"
