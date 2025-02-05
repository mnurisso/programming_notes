# Basic Bash Commands

## Navigation

- `pwd`: Display the current working directory.
- `ls`: List files and directories in the current directory.
  - `ls -l`: Detailed list with permissions, sizes, and modification dates.
  - `ls -a`: Include hidden files.
- `cd [directory]`: Change to the specified directory.
  - `cd ..`: Move up one directory level.
  - `cd ~`: Navigate to the home directory.

## File and Directory Operations

- `mkdir [directory]`: Create a new directory.
- `rmdir [directory]`: Remove an empty directory.
- `rm [file]`: Delete a file.
  - `rm -r [directory]`: Recursively delete a directory and its contents.
- `cp [source] [destination]`: Copy files or directories.
  - `cp -r [source_directory] [destination]`: Recursively copy directories.
- `mv [source] [destination]`: Move or rename files and directories.

## Viewing and Editing Files

- `cat [file]`: Display the contents of a file.
- `less [file]`: View file contents page by page.
- `head [file]`: Display the first 10 lines of a file.
- `tail [file]`: Display the last 10 lines of a file.
  - `tail -f [file]`: Continuously monitor a file for new content.

## Permissions

- `chmod [permissions] [file]`: Change file or directory permissions.
  - Example: `chmod 755 [file]` sets read, write, and execute permissions for the owner, and read and execute permissions for others.
- `chown [owner]:[group] [file]`: Change the owner and group of a file or directory.

## System Information

- `whoami`: Display the current username.
- `uname -a`: Show system information.
- `df -h`: Display disk space usage in human-readable format.
- `top`: Display active processes and system resource usage.

## Searching and Finding

- `find [directory] -name [filename]`: Search for files and directories by name.
- `grep [pattern] [file]`: Search for a pattern within a file.
  - `grep -r [pattern] [directory]`: Recursively search within a directory.

## Process Management

- `ps`: Display currently running processes.
  - `ps aux`: Detailed view of all processes.
- `kill [PID]`: Terminate a process by its Process ID (PID).
  - `kill -9 [PID]`: Forcefully terminate a process.

## Networking

- `ping [host]`: Check connectivity to a host.
- `ssh [user]@[host]`: Connect to a remote host via SSH.
- `scp [source] [user]@[host]:[destination]`: Securely copy files to a remote host.

## Miscellaneous

- `alias [name]='[command]'`: Create a shortcut for a command.
  - Example: `alias ll='ls -l'` creates an alias `ll` for `ls -l`.
- `history`: Display the list of previously executed commands.
- `clear`: Clear the terminal screen.

*Note: Replace items in brackets `[]` with your specific parameters, and omit the brackets when typing the commands.*