#!/bin/bash

# Shell Vars
PROFILE_SOURCE=/home/vagrant-shared/.bash_profile
PROFILE_GUEST=/home/vagrant/.bash_profile

# Node Vars
NODE_VER=7.5.0

# App Vars
APPROOT=/vagrant

# NVM ##################################################################

echo "[user] Installing NVM"
curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh -o install_nvm.sh
bash install_nvm.sh

echo "[user] Loading NVM"
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# NODE ##################################################################

echo "[user] Installing Node"
nvm install $NODE_VER

# DOTFILES ###############################################################

cd /home/vagrant

if [ -e $PROFILE_SOURCE ]
then
	echo "[user] Found .bash_profile, creating symlink"
	ln -s $PROFILE_SOURCE $PROFILE_GUEST
else
	echo "[user] Skipping .bash_profile symlink"
fi

echo "[user] System provision complete"

# CHANGE DIRECTORY ######################################################

echo "[user] Changing to $APPROOT"
cd $APPROOT

# INSTALL MODULES #######################################################

echo '[user] Installing modules'
npm install


