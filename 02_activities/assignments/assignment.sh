#!/bin/bash
set -x

############################################
# DSI CONSULTING INC. Project setup script #
############################################
# This script creates standard analysis and output directories
# for a new project. It also creates a README file with the
# project name and a brief description of the project.
# Then it unzips the raw data provided by the client.

mkdir analysis output
touch README.md
echo "# Project Name: DSI Consulting Inc." > README.md
echo "# Project Name: DSI Consulting Inc." > README.md
touch analysis/main.py

# download client data
curl -Lo rawdata.zip https://github.com/UofT-DSI/shell/raw/refs/heads/main/02_activities/assignments/rawdata.zip
unzip -q rawdata.zip

###########################################
# Complete assignment here

# 1. Create a directory named data
mkdir data #creates directory named data

# 2. Move the ./rawdata directory to ./data/raw
mv ./rawdata ./data/raw #move rawdata directory to raw directory

# 3. List the contents of the ./data/raw directory
ls ./data/raw #list contents of subdirectory

# 4. In ./data/processed, create the following directories: server_logs, user_logs, and event_logs
cd data #move to data directory
mkdir processed #creates processed subdirectory in data directory
cd ./processed #move into processed directory
mkdir server_logs user_logs event_logs #creates server_logs, user_logs, and event_logs directory

# 5. Copy all server log files (files with "server" in the name AND a .log extension) from ./data/raw to ./data/processed/server_logs
cd .. #move back to data directory
cp ./raw/*server*.log ./processed/server_logs/ #copies all files with "server" in the name, and carry a .log extension, to the .data/processed/server_logs destination folder

# 6. Repeat the above step for user logs and event logs
cp ./raw/*user*.log ./processed/user_logs/ 
cp ./raw/*event*.log ./processed/event_logs/ #like line 44, except it copies files to event_logs

# 7. For user privacy, remove all files containing IP addresses (files with "ipaddr" in the filename) from ./data/raw and ./data/processed/user_logs
rm ./raw/*ipaddr*.log #removes log files with "ipaddr"
rm ./raw/*ipaddr*.txt #removes txt files with "ipaddr"
rm ./processed/user_logs/*ipaddr*.log #removes log files with "ipaddr"
rm ./processed/user_logs/*ipaddr*.txt #removes txt files with "ipaddr"
# 8. Create a file named ./data/inventory.txt that lists all the files in the subfolders of ./data/processed
ls processed/* > inventory.txt 

###########################################

echo "Project setup is complete!"