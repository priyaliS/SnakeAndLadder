#! /bin/bash

echo "welcome to snake and ladder simulator"

playerOnePosition=0
playerTwoPosition=0

diceRolls=0

function dieRoll()
{

	playerPosition=$1
	NOPLAY=0
	LADDER=1
	SNAKE=2

	dieValue=$(( (( $RANDOM%6 ))+1 ))

	case $(( (( $RANDOM%3 ))+1 )) in

		$NOPLAY) playerPosition=$playerPosition ;;

		$LADDER) playerPosition=$(( $playerPosition+$dieValue )) ;;

		$SNAKE) playerPosition=$(( $playerPosition-$dieValue )) ;;

	esac

	if [ $playerPosition -lt 0 ]
	then
	playerPosition=0
	elif [ $playerPosition -gt 100 ]
	then
	playerPosition=$(( $playerPosition-$dieValue ))
	fi

	echo $playerPosition
}

function switchPlayer()
{


	while [[ $playerOnePosition -lt 100 ]] && [[ $playerTwoPosition -lt 100 ]]
	do

		playerOnePosition=$(dieRoll $playerOnePosition)

		echo "player one position is  "$playerOnePosition

		playerTwoPosition=$(dieRoll $playerTwoPosition)

		echo "player two position is  "$playerTwoPosition

		dieRolls=$(( $dieRolls+1 ))
	done
}

function winnerIs()
{
while [ $playerOnePosition -lt 100 ] && [ $playerTwoPosition -lt 100 ]
	do
		switchPlayer

		if [ $playerOnePosition -eq 100 ]
		then
			echo "Player One Won "
 		break
		elif [ $playerTwoPosition -eq 100 ]
		then
			echo "Player Two Won "
		break
		fi
	done
}
winnerIs
echo "Dice rolled to win is "$dieRolls
