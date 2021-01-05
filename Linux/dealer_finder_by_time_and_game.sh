#!/bin/bash

if [ $4 == 1 ]
then
	grep $1":00:00 "$2 $3_Dealer_schedule | awk -F" " '{print $3, $4}'
elif [ $4 == 2 ]
then
	grep $1":00:00 "$2 $3_Dealer_schedule | awk -F" " '{print $5, $6}'
elif [ $4 == 3 ]
then
	grep $1":00:00 "$2 $3_Dealer_schedule | awk -F" " '{print $7, $8}'
else
	echo "Please select a valid game id."
	echo "1 for BlackJack"
	echo "2 for Roulette"
	echo "3 for Texax Holdem"
fi
