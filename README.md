# System Management Script

This script is a comprehensive tool for managing various aspects of a Linux system. It provides a menu-driven interface for performing tasks related to user management, system monitoring, service management, log viewing, and backup management.

## Features

### 1. **User Management**
   - **Add User**: Adds a new user to the system.
   - **Delete User**: Deletes an existing user from the system.
   - **List Users**: Lists all users on the system.
   - **Lock User**: Locks a user account to prevent login.
   - **Unlock User**: Unlocks a previously locked user account.
   - **Add User to Group**: Adds a user to a specified group.
   - **Change User Password**: Changes the password for a user.
   - **Check User Login**: Checks if a user is currently logged in.

### 2. **System Monitoring**
   - **View Disk Usage**: Displays disk usage information.
   - **Check Memory Usage**: Shows memory usage statistics.
   - **List Active Processes**: Lists all active processes.
   - **Monitor CPU Usage**: Displays CPU usage information.
   - **Check Network Statistics**: Shows network statistics.
   - **View System Uptime**: Displays the system uptime.

### 3. **Service Management**
   - **Start Service**: Starts a specified system service.
   - **Stop Service**: Stops a specified system service.
   - **Check Service Status**: Displays the status of a specified service.

### 4. **Log Viewer**
   - **View Entire Log**: Displays the entire contents of a specified log file.
   - **Search Log**: Searches a log file for a specified term.
   - **Filter Log by Keyword**: Filters a log file by a specified keyword.

### 5. **Backup Utility**
   - **Create Backup**: Creates a backup of a specified directory.
   - **Restore Backup**: Restores a backup from a specified backup file.
   - **List Backups**: Lists all available backups in the backup directory.

## Usage

1. **Running the Script**:
   - Ensure the script has execute permissions:
     ```bash
     chmod +x system_management.sh
     ```
   - Run the script:
     ```bash
     ./system_management.sh
     ```

2. **Navigating the Menu**:
   - The script presents a main menu with options for each management category.
   - Select an option by entering the corresponding number.
   - Each category has its own sub-menu with specific tasks.

3. **Exiting the Script**:
   - To exit the script, select the "Exit" option from the main menu.

## Global Variables

- `BACKUP_DIR`: The directory where backups will be stored. Default is `/tmp/backups`.

## Notes

- **Permissions**: Some operations (e.g., user management, service management) require root privileges. Ensure you run the script with `sudo` if necessary.
- **Log File Path**: When using the log viewer, provide the full path to the log file you wish to view or search.