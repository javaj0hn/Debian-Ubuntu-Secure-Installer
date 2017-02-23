#!/usr/bin/env bash
echo "#######Debian/Ubuntu Server Secure Script#######\n"
echo "#######Updating#######\n"
sudo apt-get upgrade
sudo apt-get update
echo "#######Creating .ssh folder and authorized_keys file#######\n"
mkdir ~/.ssh; nano ~/.ssh/authorized_keys
sudo chmod 700 -R ~/.ssh && chmod 600 ~/.ssh/authorized_keys
echo "#######Disabling root login######\n"
if [ -f /bin/sed ]; then
  sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
fi
echo "#######Disabling password authentication#######\n"
if [ -f /bin/sed ]; then
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
fi
sudo service ssh restart
echo "#######Downloading CSF#######\n"
cd /usr/src && wget https://download.configserver.com/csf.tgz -O /usr/src/csf.tgz
echo "#######Installing CSF#######\n"
if [ ! -f "csf.tgz" ]; then
  echo "Error. Cannot find CSF.tgz"
else
tar -zxvf csf.tgz && cd csf/ && sh install.sh
cd ..
  rm -rf csf/ csf.tgz
fi
echo "Configuring CSF"
