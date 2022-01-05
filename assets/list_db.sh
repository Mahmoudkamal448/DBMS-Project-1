#!/bin/bash

clear

echo "+----------------------------+"
echo "|                            |"
echo "|        Database Name       |"
echo "|                            |"
echo "+----------------------------+"

if [ `ls db_list/ | wc -l` -gt 0 ]
then
    for db in `ls db_list/`
    do 
        echo -n "| $db"
        # calc how many space should be printed
        for ((i=1; i<=28 - `echo $db | wc -c` ; i++)); do echo -n ' '; done
        echo "|"    
    done

    echo "+----------------------------+"

    echo "press any key to to go to main menu."

    read -n1

    . ./run.sh
else
    echo "|    No Database to show     |"
    echo "+----------------------------+"
    
    select option in "Create Database" "Back"
    do
        case $option in 
            "Create Database") . ./assets/create_db.sh 
                ;;
            "Back") . ./run.sh
                ;;
            *) echo "NOT valid option ❌" 
                ;;
        esac
    done
fi