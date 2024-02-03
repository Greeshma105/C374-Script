#!/bin/bash

read -p "Enter your password: " password

len="${#password}"

if [ $len -ge 8 ]; then
    if echo "$password" | grep -q '[0-9]' && echo "$password" | grep -q '[A-Z]' && echo "$password" | grep -q '[a-z]'; then
        echo "Strong password"
    else
        if ! echo "$password" | grep -q '[0-9]'; then
            echo "Password should have numbers."
        fi
        if ! echo "$password" | grep -q '[A-Z]'; then
            echo "Password should have uppercase characters."
        fi
        if ! echo "$password" | grep -q '[a-z]'; then
            echo "Password should have lowercase characters."
        fi
    fi
else
    echo "Password should have minimum 8 characters"
fi
