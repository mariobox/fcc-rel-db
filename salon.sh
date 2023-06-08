#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

DISPLAY_SERVICES() {
echo -e "\nWhich cut would you like?\n"  
AVAILABLE_SERVICES=$($PSQL"SELECT service_id, name FROM services")
echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done

read SERVICE_ID_SELECTED

if [[ ! $SERVICE_ID_SELECTED =~ ^[0-5] ]]
then
# send to main menu
DISPLAY_SERVICES
else
echo -e "\nPlease input your phone?"
read CUSTOMER_PHONE
CHECK_PHONE=$($PSQL "SELECT * FROM customers WHERE phone='$CUSTOMER_PHONE'")
if [[ -z $CHECK_PHONE ]]
then
# get name and phone and add to customers database
echo -e "\nWhat's your name?"
read CUSTOMER_NAME
ADD_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi
echo -e "\nAt what time would you like to come?"
read SERVICE_TIME

# get customer_id and make appointment
CUST_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
MAKE_NEW_APPT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUST_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
fi
# get service name
CHOSEN_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
echo -e "\nI have put you down for a $CHOSEN_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
}




DISPLAY_SERVICES