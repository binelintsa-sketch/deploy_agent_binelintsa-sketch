Deploy_agent_binelintsa-sketch
Project Setup and Process Automation

Script Automation. 

#Overview
 setup_project.sh automates the initialization of attendance tracking systems. It creates parent directory (attendance_tracker_(name) and sub-directory tructures(helpers and reports). the script will prompt the user if he wants to update the threshold values of attendance tracker found in config.json by asking entering yes  (y) or No (Y). if the answer is yes the user will prompt the warning and failure values esle the script will skip this step and used the default values using the sed -i command. this will configures the environment thresholds, and finally  verifies if python3 is installed on the system. The code os built in with a SIGINT in case you started your setup with a wrong name or you just want to delete everything.

#Expected result; After running the script, the output should look like this.

attendance_tracker_<name>/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log

#How does the SIGINT function
In case the user changed his mind or a trigger happens the user user can prees Ctrl+c and the created directory will be automatically deleted and save as an archive (attendance_tracker_(name)_archive.Zip. Thus it deletes directory that is incomplete.
