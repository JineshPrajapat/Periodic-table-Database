#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

# Check if an element argument is provided
if [[ -z $1 ]]
then
  echo  -e "Please provide an element as an argument."
else
  # Check if the argument is a number or a string
  if [[ ! $1 =~ ^[0-9]+$ ]]
  then
    # Query the database to find the element by name
    ELEMENT=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, types.type FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE elements.name LIKE '$1%' ORDER BY atomic_number LIMIT 1")
  else
    # Query the database to find the element by atomic number
    ELEMENT=$($PSQL "SELECT atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, types.type FROM properties JOIN elements USING(atomic_number) JOIN types USING(type_id) WHERE elements.atomic_number=$1")
  fi

  # Check if the element is found in the database
  if [[ -z $ELEMENT ]]
  then
    echo -e "I could not find that element in the database."
  else
    # Parse the result of the query and display the element information
    echo $ELEMENT | while IFS=\| read ATOMIC_NUMBER ATOMIC_MASS MPC BPC SY NAME TYPE
    do
      echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SY). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius." 
    done
  fi
fi
