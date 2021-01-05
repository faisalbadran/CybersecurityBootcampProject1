#!/bin/bash

grep $1":00:00 "$2 $3_Dealer_schedule | awk -F" " '{print $5, $6}'
