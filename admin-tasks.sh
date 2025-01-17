#!/bin/bash

# Global Variables
BACKUP_DIR="/tmp/backups"

# ---------------- USER MANAGEMENT ----------------9
manage_users(){
    while true; do
        PS3="Select an option for User Management (1-7): "
        options=("Add User" "Delete User" "List Users" "Lock User" "Unlock User" "Add User to Group" "Change User Password" "Check User Login" "Back to Main Menu")
        select choice in "${options[@]}"; do
            case $REPLY in
                1)
                    read -p "Enter username to add: " username
                    if id "$username" &>/dev/null; then
                        echo "User '$username' already exists!"
                    else
                        sudo useradd "$username"
                        echo "User '$username' added successfully!"
                    fi
                    ;;
                2)
                    read -p "Enter username to delete: " username
                    if id "$username" &>/dev/null; then
                        sudo userdel -r "$username"
                        echo "User '$username' deleted successfully!"
                    else
                        echo "User '$username' does not exist!"
                    fi
                    ;;
                3)
                    echo "Existing System Users:"
                    cut -d: -f1 /etc/passwd
                    ;;
                4) 
                    read -p "Enter username to lock: " username
                    if id "$username" &>/dev/null; then
                        sudo usermod -L "$username"
                        echo "User '$username' locked successfully!"
                    else
                        echo "User '$username' does not exist!" 
                    fi
                 ;;
                5)
                    read -p "Enter username to unlock: " username
                    if id "$username" &>/dev/null; then
                        sudo usermod -U "$username"
                        echo "User '$username' unlocked successfully!"
                    else 
                        echo "User '$username' does not exist!"
                    fi
                    ;;
                6) 
                    read -p "Enter username to add to a group: " username
                    read -p "Enter group name: " groupname
                    if id "$username" &>/dev/null; then
                        sudo usermod -aG "$groupname" "$username"
                        echo "User '$username' added to group '$groupname' successfully!"
                    else
                        echo "User '$username' does not exist!"
                    fi
                    ;;
                
                 7) 
                    read -p "Enter username to change the password: " username
                    if id "$username" &>/dev/null; then
                        sudo passwd "$username"
                    else 
                        echo "User '$username' does not exist!" 
                    fi 
                    ;; 
                    
                    8) 
                        read -p "Enter username to check if logged in: " username 
                        if who | grep -w "$username" &>/dev/null; then 
                            echo "User '$username' is currently logged in." 
                        else 
                            echo "User '$username' is not logged in." 
                        fi 
                        ;;
                    9)
                        return  # Exit the function and return to the main menu
                    ;;
                    *)
                        echo "Invalid option. Try again."
                    ;;
            esac
                echo ""
                # Exit the select loop to re-display the menu
                break 
        done
    done
}

# ---------------- SYSTEM MONITORING ----------------
monitor_system() {
    PS3="Select an option for System Monitoring (1-8): "
    options=(
            "View Disk Usage" 
            "Check Memory Usage" 
            "List Active Processes" 
            "Monitor CPU Usage" 
            "Check Network Statistics" 
            "View System Uptime" 
            "Back to Main Menu"
        )
    while true; do
        select choice in "${options[@]}"; do
            case $REPLY in
                1) 
                    echo "Disk Usage:"
                    df -h
                    ;;
                2) 
                    echo "Memory Usage:"
                    free -h
                    ;;
                3) 
                    echo "Active Processes:"
                    ps aux
                    ;;
                4) 
                    echo "CPU Usage:"
                    top -n 1 -b | head -n 12
                    ;;
                5) 
                    echo "Network Statistics:"
                    netstat -s
                    ;;
                6) 
                    echo "System Uptime:"
                    uptime
                    ;;

                7) 
                    echo "Returning to Main Menu..."
                    return
                    ;;
                *)
                    echo "Invalid option. Please try again."
                    ;;
            esac
            echo ""
            break
        done
    done
}

# ---------------- SERVICE MANAGEMENT ----------------
manage_services() {
    while true; do
        PS3="Select an option for Service Management (1-4): "
        options=("Start Service" "Stop Service" "Check Service Status" "Back to Main Menu")
        select choice in "${options[@]}"; do
            case $REPLY in
                1)
                    read -p "Enter service name to start: " service
                    sudo systemctl start "$service" && echo "Service '$service' started successfully!" || echo "Failed to start service '$service'."
                    ;;
                2)
                    read -p "Enter service name to stop: " service
                    sudo systemctl stop "$service" && echo "Service '$service' stopped successfully!" || echo "Failed to stop service '$service'."
                    ;;
                3)
                    read -p "Enter service name to check status: " service
                    sudo systemctl status "$service"
                    ;;
                4)
                    return
                    ;;
                *)
                    echo "Invalid option. Try again."
                    ;;
            esac
            echo ""
            break
        done
    done
}

# ---------------- LOG VIEWER ----------------
view_logs() {
    read -p "Enter log file path (e.g., /var/log/syslog): " log_file
    while true; do
        if [[ -f "$log_file" ]]; then
            PS3="Select an option for Log Viewer (1-4): "
            options=("View Entire Log" "Search Log" "Filter Log by Keyword" "Back to Main Menu")
            while true; do
                select choice in "${options[@]}"; do
                    case $REPLY in
                        1) cat "$log_file" ;;
                        2)
                            read -p "Enter search term: " term
                            grep -i "$term" "$log_file"
                            ;;
                        3)
                            read -p "Enter keyword to filter: " keyword
                            grep -iw "$keyword" "$log_file"
                            ;;

                        4) return;;

                        *)
                            echo "Invalid option. Try again."
                            break;;
                        
                    esac
                        echo ""
                        break
                done
            done
        
        else
            echo "Log file '$log_file' does not exist."
            break
        
        fi
    done
}

# ---------------- BACKUP UTILITY ----------------
backup_utility() {
    if [[ ! -d "$BACKUP_DIR" ]]; then
        mkdir -p "$BACKUP_DIR"
    fi

        PS3="Select an option for Backup Utility (1-4): "
        options=("Create Backup" "Restore Backup" "List Backups" "Back to Main Menu")
        while true; do
            select choice in "${options[@]}"; do
                case $REPLY in
                1)
                    read -p "Enter directory to backup: " dir
                    if [[ -d "$dir" ]]; then
                        tar_file="$BACKUP_DIR/$(basename "$dir")_backup_$(date +%Y%m%d%H%M%S).tar.gz"
                        tar -czf "$tar_file" "$dir"
                        echo "Backup created at $tar_file"
                    else
                        echo "Directory '$dir' does not exist."
                    fi
                    ;;
                2)
                    read -p "Enter backup file to restore: " tar_file
                    if [[ -f "$tar_file" ]]; then
                        tar -xzf "$tar_file" -C /
                        echo "Backup restored from $tar_file"
                    else
                        echo "Backup file '$tar_file' does not exist."
                    fi
                    ;;
                3)
                    echo "Available Backups:"
                    ls "$BACKUP_DIR"
                    ;;
                4)
                    return 
                    ;; # Exit the function and return to the main menu
                esac
            done
        done
}

# THE MAIN MENU
while true
do
    PS3="Your choice: "
    options=("User Management" "System Monitoring" "Service Management" "Log Viewer" "Backup Utility" "Exit" )
    select main_choice in "${options[@]}"
    do
        case $REPLY in
            1) manage_users ;;
            2) monitor_system ;;
            3) manage_services ;;
            4) view_logs ;;
            5) backup_utility ;;
            6) echo "Exiting. Goodbye!" ; exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac
        break
    done
done