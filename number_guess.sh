#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUM_TRIES=0
GUESS_LOOP() {
# ask for number
read GUESS
# add one to the number of tries
NUM_TRIES=$(($NUM_TRIES+1))
# validate guess
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
GUESS_LOOP 
else
  if [[ $GUESS == $RANDOM_NUM ]]
  then
    echo "You guessed it in $NUM_TRIES tries. The secret number was $RANDOM_NUM. Nice job!"
    if [[ -z $BEST_GAME ]]
    then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUM_TRIES where username='$USER_NAME';")
    fi
    if [[ $NUM_TRIES -lt $BEST_GAME ]]
    then
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game=$NUM_TRIES where user_id=$USER_ID;")
    fi
  else
    if [[ $GUESS -lt $RANDOM_NUM ]]
    then
    # too low - ask to guess again
    echo "It's higher than that, guess again:"
    GUESS_LOOP
    else
    # too high - ask to guess again
    echo "It's lower than that, guess again:"
    GUESS_LOOP
    fi
  fi
fi
}

RANDOM_NUM=$((RANDOM % 1000 + 1))
echo $RANDOM_NUM
echo "Enter your username:"
read USER_NAME
CHECK_USER=$($PSQL "SELECT username FROM users WHERE username='$USER_NAME';")
# if empty welcome as new user
if [[ -z $CHECK_USER ]]
then
echo "Welcome, $USER_NAME! It looks like this is your first time here."
ADD_NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME');")
INCREASE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED+1)) WHERE username='$USER_NAME';")
echo "Guess the secret number between 1 and 1000:"
GUESS_LOOP
else
NAME=$($PSQL "SELECT username FROM users WHERE username='$USER_NAME';")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USER_NAME';")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USER_NAME';")
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USER_NAME';")
echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# update the number of games played to include this one
INCREASE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$(($GAMES_PLAYED+1)) WHERE user_id=$USER_ID;")
echo "Guess the secret number between 1 and 1000:"
GUESS_LOOP


fi