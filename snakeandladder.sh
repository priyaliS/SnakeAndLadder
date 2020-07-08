#! /bin/bash

echo "welcome to snake and ladder simulator"

playeronePosition=0

dieValue=$(( (( $RANDOM%6 ))+1 ))

echo "player one die value is : " $dieValue
