#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WG OG
do
if [[ $YEAR != year ]]
    then
    
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")

    # if not found
    if [[ -z $TEAM_ID ]]
      then
      # insert major
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
      echo Inserted into teams, $WINNER
      fi
      
    # get new major_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    fi

    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

    # if not found
    if [[ -z $TEAM_ID ]]
      then
      # insert major
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
      echo Inserted into teams, $OPPONENT
      fi
      
    # get new major_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    fi

fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WG OG
do
if [[ $YEAR != year ]]
  then
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'" )
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
  INSERT_INTO_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WG, $OG)")
  if [[ $INSERT_INTO_GAMES == "INSERT 0 1" ]]
    then
    echo Inserted game $WINNER $WG - $OPPONENT $OG
  fi
fi
done