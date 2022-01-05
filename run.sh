#!/bin/bash
# shopt -s extglob

# First run
clear
if [ ! -d db_list ]
then
    mkdir db_list;
fi

ex()
{
    clear
    echo "+----------------------------------------+"
    echo "|                                        |"
    echo "|                 Bye 👋                 |"
    echo "|       We hope to see you again 😇      |"
    echo "|                                        |"
    echo "+----------------------------------------+"
    exit
}

# to check if name restricted or not
function is_vaild_name
{
    if [[ $1 =~ ["!@#$\'%^\&?*(){}\"<>/\\|+,.=~"] || 
    $1 =~ ^['0-9'] || 
    $1 == *']'* || 
    $1 == *'['* || 
    $1 == *'-'* || 
    $1 == *' '* || 
    `echo $1 | grep '*' | wc -c` > 0 || 
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

# to try agin if user make an error 
function try_again
{
    select option in 'Try agin ?' 'Back'
    do 
        case $option in
            'Try agin ?') . ./assets/$1 ;;
            'Back') . ./run.sh ;;
            *) echo "NOT valid option ❌" ;;
        esac
    done
}

function ask_loop
{
    # ask the user if 
    read -n1 -p "Would you like to try again? yY|nN: " ans
    echo

    # ensure the user input is Y or N
    until [[ ${ans^^} == 'Y' || ${ans^^} == 'N' ]]
    do
        echo "NOT vaild input ❌"
        read -n1 -p "Try again: " ans
        echo
    done

    if [ ${ans^^} == 'N' ]
    then
        . ./assets/$1
    fi
}

# to render the menu after scrept ends 
# you have to send the first option as a first arg and the script you want to run as the second arg
function end_selection
{
    select option in "$1" 'Back to main menu' 'Exit'
    do
        case $option in
            "$1") . ./assets/$2 ;;
            'Back to main menu') . ./run.sh ;;
            'Exit') ex ;;
            *) echo "NOT valid option ❌" ;;
        esac
    done
}


echo "   +----------------------------------------+"
echo "   |                                        |"
echo "   |       Wellcome to DBMS project         |"
echo "   |  Made with 💗 by Abd El-Rahman & Mark  |"
echo "   |                                        |"
echo "   +----------------------------------------+"

PS3=" Please select an option: "

select option in "Create Database" "List Databases" "Connect To Databases" "Drop Database" "Exit"
    do
        case $option in
            "Create Database") . ./assets/create_db.sh
                ;;
            "List Databases") . ./assets/list_db.sh
                ;;
            "Connect To Databases") . ./assets/connect_db.sh
                ;;
            "Drop Database") . ./assets/drop_db.sh
                ;;
            "Exit") ex
                ;;
            *) echo "NOT valid option ❌" 
                ;;
        esac    
done
