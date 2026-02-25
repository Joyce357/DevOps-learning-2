#!/bin/bash

# This script is a simple welcome message for users running it in a bash environment.
echo "Welcome to the system!"

read -s "Enter your PIN: " pin

if [ "$pin" == "1234" ]; then
  echo "You have successfully logged in"

elif [ "$pin" == "0000" ]; then
  echo "Weak PIN, please change it"

elif [ "$pin" == "9999" ]; then
  echo "Admin access granted"

else
  echo "Wrong password"
fi