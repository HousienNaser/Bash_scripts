# System Management Script - README

This script is a comprehensive system management tool designed to simplify user management, system monitoring, service management, log viewing, and backup operations. It provides an interactive menu-driven interface for performing various administrative tasks on a Linux system.

---

## Features

### 1. **User Management**
   - Add a new user.
   - Delete an existing user.
   - List all system users.
   - Lock or unlock a user account.
   - Add a user to a group.
   - Change a user's password.
   - Check if a user is currently logged in.

### 2. **System Monitoring**
   - View disk usage (`df -h`).
   - Check memory usage (`free -h`).
   - List active processes (`ps aux`).
   - Monitor CPU usage (`top`).
   - Check network statistics (`netstat -s`).
   - View system uptime (`uptime`).

### 3. **Service Management**
   - Start a service.
   - Stop a service.
   - Check the status of a service.

### 4. **Log Viewer**
   - View the entire contents of a log file.
   - Search for specific terms in a log file.
   - Filter logs by a keyword.

### 5. **Backup Utility**
   - Create a backup of a directory (stored in `/tmp/backups`).
   - Restore a backup from a `.tar.gz` file.
   - List all available backups.

---

## How to Use

1. **Save the Script**:
   - Save the script to a file, e.g., `system_manager.sh`.

2. **Make the Script Executable**:
   ```bash
   chmod +x system_manager.sh
   ```

3. **Run the Script**:
   ```bash
   sudo ./system_manager.sh
   ```
   - **Note**: Some operations (e.g., user management, service management) require root privileges, so run the script with `sudo`.

4. **Navigate the Menu**:
   - The script presents a main menu with options for each functionality.
   - Use the number keys to select an option and follow the prompts.

---

## Global Variables

- `BACKUP_DIR="/tmp/backups"`: The directory where backups are stored. You can modify this path if needed.

---

## Notes
- **Backups**: Backups are stored in `/tmp/backups` by default. Ensure this directory exists or modify the `BACKUP_DIR` variable.
- **Logs**: The log viewer requires the full path to the log file (e.g., `/var/log/syslog`).
- **Permissions**: Some operations (e.g., user management, service management) require root privileges.

---

## License
This script is provided as-is under the MIT License. Feel free to modify and distribute it as needed.

---

Enjoy managing your system with ease! 🚀