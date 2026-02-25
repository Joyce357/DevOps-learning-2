#!/bin/bash

day_of_week=$1 # Take the first command line argument


case $day_of_week in
    Monday|monday)
        echo "Start of a new week!"
        ;;
    Tuesday|Wednesday|Thursday)
        echo "It's a busy week!"
        ;;
    Friday)
        echo "Almost the weekend!"
        ;;
    Saturday|Sunday)
        echo "Enjoy the weekend!"
        ;;
    *)
        echo "Unknown day: $day_of_week"
        ;;
esac
