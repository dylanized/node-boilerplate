#! /usr/bin/env bash

echo "[root] Starting system provisioning"

# Vars
LOG_FOLDER=/vagrant/logs

# SETUP ########################################################################

echo "[root] Cleaning old packages"
sudo apt-get autoremove
	
echo "[root] Updating packages list"
apt-get -qq update

echo "[root] Installing base packages"
apt-get -y install vim curl build-essential python-software-properties git libssl-dev

echo "[root] Updating packages list"
apt-get -qq update

# LOG FOLDER ###################################################################

if [ -e $LOG_FOLDER ]
then
	echo "[root] Found log folder"
else
	echo "[root] Log folder not found, creating it"
	mkdir $LOG_FOLDER
fi

echo "[root] Setting permissions on log folder"
chmod -R 777 $LOG_FOLDER

# MongoDB ####################################################################

echo "[root] Installing MongoDB"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org