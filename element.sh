PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# check if there is an argument:
if [[ $1 ]]
then
# check if argument is a number
  if [[ $1 =~ ^[0-9]+$ ]] 
  then
    GIVEN_ARG_IN_DB=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id
    WHERE elements.atomic_number=$1;")
    #check if number in argument is valid
    if [[ -z $GIVEN_ARG_IN_DB ]]
    then
    echo "I could not find that element in the database."
    else
      echo "$GIVEN_ARG_IN_DB" | while read ATOMIC_NO BAR SYMBOL BAR NAME BAR ATOMIC_NO_2 BAR MASS BAR MELTING BAR BOILING BAR TYPE_ID BAR TYPE_ID_2 BAR TYPE
      do
      # print info about the element
      echo "The element with atomic number $ATOMIC_NO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
      done
    fi
  else
    # query the database if argument is not a number
    GIVEN_ARG_IN_DB=$($PSQL "SELECT * FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id
    WHERE elements.symbol='$1' OR elements.name='$1';")
    # check if the argument is valid
    if [[ -z $GIVEN_ARG_IN_DB ]]
    then
    echo "I could not find that element in the database."
    else
    echo "$GIVEN_ARG_IN_DB" | while read ATOMIC_NO BAR SYMBOL BAR NAME BAR ATOMIC_NO_2 BAR MASS BAR MELTING BAR BOILING BAR TYPE_ID BAR TYPE_ID_2 BAR TYPE
    do
    echo "The element with atomic number $ATOMIC_NO is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
    fi
  fi

else
  # ask user to input a valid argument
  echo -e "Please provide an element as an argument."
fi
