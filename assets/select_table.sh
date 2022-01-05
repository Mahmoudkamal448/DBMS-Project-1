#!/bin/bash

clear
connected_db=test
function is_vaild_name
{
    if [[ $1 =~ ["!@#$\'%^\&?*(){}\"<>/\\|+,.=~"] || 
    $1 =~ ^['0-9'] || 
    $1 == *']'* || 
    $1 == *'['* || 
    $1 == *'-'* || 
    $1 == "db_list" || 
    $1 == "run.sh" || 
    $1 == "meta" || 
    $1 == "tables" ||
    $1 == "" ]]
    then 
        echo false;
    else
        echo true;
    fi
}

echo "+----------------------------------------+"
echo "|                                        |"
echo "|  You are about to select certain table |"
echo "|   🚨 NOT allowed special characters    |"
echo "|   🚨 NOT allowed to start with number  |"
echo "|   🚨 Start with char or _ only         |"
echo "|                                        |"
echo "+----------------------------------------+"
echo
echo "******************************************"

read -p "Please enter the table name: " selected_table

# check if the name is valid
while [ `is_vaild_name $selected_table` == false ]
do
    echo "NOT valid table name ❌"
    read -p "Please try again: " selected_table 
done

# check if table is exists or not
if [ ! -f db_list/$connected_db/tables/$selected_table ]
then
    echo "$selected_table table NOT exist ❌"
    try_again select_table.sh 
fi


echo "selected"


