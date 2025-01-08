#!/bin/bash

# Set the prompt for the select menu
PS3="Your choice: "

# Display a menu with options for system administration tasks
select ITEM in "Add User " "List All Processes" "Kill Process" "Install Program" "Quit"
do
    # Option 1: Add a user
    if [[ $REPLY -eq 1 ]]
    then
        # Prompt the user to enter a username
        read -p "Enter the username: " username
        
        # Check if the user already exists in the system
        output="$(grep -w $username /etc/passwd)"
        if [[ -n $output ]]; then
            echo "The username $username already exists."
        else 
            # Add a new user with a home directory and default shell
            sudo useradd -m -d /bin/bash "$username"
        fi

        # Check if the useradd command was successful
        if [[ $? -eq 0 ]]
        then 
            echo "The user $username was added successfully."
            # Display the last line of /etc/passwd to confirm the new user
            tail -n 1 /etc/passwd
        else 
            echo "There was an error adding the user $username."
        fi
	
    # Option 2: List all running processes
    elif [[ $REPLY -eq 2 ]]
    then
        echo "Listing all processes..."
        sleep 1
        # Display all processes using ps command
        ps -aux

    # Option 3: Kill a process by name
    elif [[ $REPLY -eq 3 ]]
    then
        echo "Enter the name of the process to kill:"
        read process
        # Attempt to kill the process by name
        pkill $process

    # Option 4: Install a program
    elif [[ $REPLY -eq 4 ]]
    then
        echo "Enter the name of the program to install:"
        read program
        # Install the program using apt package manager
        sudo apt install $program

    # Option 5: Quit the script
    elif [[ $REPLY -eq 5 ]]
    then
        echo "Quitting..."
        sleep 1
        exit
    fi

done
