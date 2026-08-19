Deploy_agent_binelintsa-sketch

Project Setup and Process Automation 

#Project overview

setup_project.sh is an automated Bash script designed to quickly initialize and configure an isolated attendance tracking workspace. It builds a standardized directory structure, copies core dependency files, dynamically manages system thresholds, and includes signal interruption handling to prevent partial setups.

#What the Script Does

*Creates Directory Structure: Prompts for a project identifier and sets up the root project folder attendance_tracker_<name>/ along with its subdirectories (Helpers/ and reports/).

*Deploys Starter Files: Automatically copies key assets (attendance_checker.py, assets.csv, config.json, and reports.log) into their respective folders.

*Threshold Configuration: Asks if you want to update the default attendance thresholds (y/n). If yes, it prompts for custom Warning and Failure values and updates config.json in-place using sed -i. If no, default values are preserved.

*Environment status Check: Verifies that python3 is installed and running on the target environment.

*Process Interruption Safety (SIGINT): Built-in signal handling catches Ctrl + C during execution. If interrupted mid-setup, the script automatically archives the partial directory as attendance_tracker_<name>_archive.tar.gz and removes the incomplete folder to keep your workspace clean.

#Expected Directory Structure

After a successful execution, The project directory will look like this:

attendance_tracker_<name>/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log

# To make the script executable, use the command chmod and ru ./setup_project.sh, enter your directory name and take the option to enter your threshold valeus or not. 

#Interruption Handling (Ctrl + C)

If you make a mistake or need to cancel setup mid-way, press Ctrl + C. The SIGINT trap will immediately trigger:

process interrupted! saving and cleaning up...
Action taken: The incomplete attendance_tracker_<name> directory is deleted from your workspace and saved as attendance_tracker_<name>_archive.tar.gz. 
