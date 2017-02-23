#!/usr/bin/env bash
echo "Debian/Ubuntu Server Secure Script\n"
echo "Updating..."
sudo apt-get upgrade
sudo apt-get update
echo "Creating .ssh folder and authorized_keys file"
mkdir ~/.ssh; nano ~/.ssh/authorized_keys
sudo chmod 700 -R ~/.ssh && chmod 600 ~/.ssh/authorized_keys
echo "Disabling root login"
echo "Disabling password authentication"
echo "Installing CSF"
echo "Configuring CSF"
