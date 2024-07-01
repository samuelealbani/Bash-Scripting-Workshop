#!/bin/bash

# comment out each section to explore the topics

### commands
# echo 'Hello World!'
# mkdir main
# touch main/message.txt

### variable expansion
# value=23
# echo $value

### arithmetic expansion
# val2=2
# sum=$((value+val2))
# echo "sum is $sum"

### command substitution
# files_in_current_dir=$(ls)
# echo $files_in_current_dir

### for loops
## iterate through lists
# for name in Gina Mandy Hannah
# do
#     echo $name
# done

## iterate ranges
# for i in {1..4}
# do
#     echo $i
# done

## C-Style
# for ((i=0; i<5; i++))
# do
#     echo $i
# done

### conditionals
# val1=20
# val2=45
# if [ $val1 -eq $val2 ]
# then
#     echo "$val1 = $val2"
# elif [ $val1 -gt $val2 ]
# then
#     echo "$val1 > $val2"
# else
#     echo "$val1 < $val2" # -lt
# fi

### positional parameters
# if [ $# -gt 0 ]
# then
#     echo "$1 is the first parameter"
# fi
# echo "you passed $# parameter(s): $@."
# if [ $# -gt 0 ]
# then
#     for name in $@
#     do
#         mkdir $name
#         echo "Dear $name, have a nice day." > $name/message.txt
#     done
# fi

### user input
# echo -n "Enter your favourite food: "
# read user_favourite
# echo "$user_favourite? Bleahhh" 

### timer
# for i in {3..1}
# do
#     echo $i
#     sleep 1
# done
# echo 'Running the sketch'

### Run the processing sketch
# processing-java --sketch=$(pwd)/visual --run &
## Assuming you want to kill it after a certain time
# sleep 10 # Adjust the sleep time as needed
## Kill the Processing sketch
# pkill -f 'java.*processing'
