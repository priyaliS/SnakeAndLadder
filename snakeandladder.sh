#! /bin/bash

echo "welcome to snake and ladder simulator"

playeronePosition=0

function playerMovement()
{

	dieValue=$(( (( $RANDOM%6 ))+1 ))

	echo "player one die value is : " $dieValue

	case $(( (( $RANDOM%3 ))+1 )) in

		1) echo "no play" ;;

		2) playeronePosition=$(( $playeronePosition+$dieValue ))
		   echo "player gone through ladder" ;;

		3) playeronePosition=$(( $playeronePosition-$dieValue ))
		   echo "player gone through snake" ;;
	esac

	if [ $playeronePosition -lt 0 ]
	then
		playeronePosition=0
	fi

	echo "Player position is : "$playeronePosition
}

while [ $playeronePosition -lt 100 ]
do
	playerMovement
done
