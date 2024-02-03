#!/bin/bash
read -p "Enter your password: " password

# Check if the length is 8 or more characters
if [ ${#password} -lt 8 ]; then
    echo "Password should be at least 8 characters long."
    exit 1
fi

# Check if the password contains both numbers and letters
if ! [[ "$password" =~ [0-9] && "$password" =~ [a-zA-Z] ]]; then
    echo "Password should contain both numbers and letters."
    exit 1
fi

# Check if the password contains both uppercase and lowercase letters
if ! [[ "$password" =~ [a-z] && "$password" =~ [A-Z] ]]; then
    echo "Password should contain both uppercase and lowercase letters."
    exit 1
fi

# If all criteria are met, the password is considered secure
echo "Password is secure!"
