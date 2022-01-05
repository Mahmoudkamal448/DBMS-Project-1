#!/bin/bash

clear

echo "+----------------------------+"
echo "|                            |"
echo "|         Table Name         |"
echo "|                            |"
echo "+----------------------------+"

# check if there are tables created before or not
if [ `ls db_list/$connected_db/tables/ | wc -l` -gt 0 ]
then
    for table in `ls db_list/$connected_db/tables/`
    do 
        echo -n "| $table"
        # calc how many space should be printed
        for ((i=1; i<=28 - `echo $table | wc -c` ; i++)); do echo -n ' '; done
        echo "|"    
    done
    echo "+----------------------------+"

    echo "press any key to to go to main menu."
    read -n1

    . ./assets/db_connected.sh
else
    # show no tables 
    echo "|     No Tables to show      |"
    echo "+----------------------------+"
    
    #show some options
    select option in "Create Table" "Back"
    do
        case $option in 
            "Create Table") . ./assets/create_table.sh 
                ;;
            "Back") . ./assets/db_connected.sh
                ;;
            *) echo "NOT valid option ❌" 
                ;;
        esac
    done   
fi
