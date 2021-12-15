#!/usr/bin/env bash

if [ $# -ne 2 ]; then
	echo "bash tester.sh <executable> <testcase-number>"
	exit 1
fi


declare -A tests

tests[1]=$"
Register user1
password1
Login user1
password1
Create
activity1
creator1
111-233-222
99-99-9999
11-12/2000
"

# DESIRED RESULTS
declare -A desired_result
desired_result[1]="all 3 illegal dates rejected."


# INTERACTION
clear 
interaction=$(expect subroutine.exp "$1" "${tests[$2]}" 2>&1)
#key_results=$(echo "$interaction" | tail -n20)
echo "$interaction"
printf "\n*****desired_result*****\n\n${desired_result[$2]}\n\n"



exit 0
