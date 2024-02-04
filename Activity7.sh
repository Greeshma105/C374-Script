#!/bin/bash

score=0  

question() {
    local question="$1"
<<<<<<< HEAD
    local answer="$2"
=======
    local correct="$2"
>>>>>>> 07602d89ebd4ffc780f5b73fcc3a2a453b534a18

    echo "$question"
    read -p "Enter 'T' for True or 'F' for False: " user_answer
    


<<<<<<< HEAD
    if [ "${user_answer}" == "$answer" ]; then
        echo "Correct"
=======
    if [ "${user_answer}" == "$correct" ]; then
        echo "Correct!"
>>>>>>> 07602d89ebd4ffc780f5b73fcc3a2a453b534a18
        ((score++))
    else
        echo "Incorrect"
    fi
}


question "1. The latest FIFA World Cup was held in 2022." "F"
question "2. Brazil won the most recent FIFA World Cup." "F"
question "3. The 2022 World Cup host country was Qatar." "T"
question "4. Lionel Messi plays for Argentina." "T"
question "5. Germany won the 2018 FIFA World Cup." "F"
question "6. Cristiano Ronaldo is from Portugal." "T"
question "7. The 2026 World Cup will be hosted by Canada, Mexico, and the United States." "T"
question "8. Neymar is a forward for the Brazil national team." "T"
question "9. The 2022 World Cup was the first to be held in November-December." "T"
question "10. Italy has won the FIFA World Cup five times." "F"

<<<<<<< HEAD
=======

>>>>>>> dde8055602c31c07e9ca36a0537cb4de0f4f6187
echo "Your final score is: $score out of 10"
