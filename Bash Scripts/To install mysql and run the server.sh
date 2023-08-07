#!/bin/bash
sudo killall mysqld
sudo systemctl disable mysql.service
sudo rm -rf /lib/systemd/system/mysql.service
sudo rm -rf /usr/lib/systemd/system/mysql.service
sudo rm -rf /etc/systemd/system/multi-user.target.wants/mysql.service
sudo rm -rf /var/lib/systemd/deb-systemd-helper-enabled/multi-user.target.wants/mysql.service
sudo rm -rf /var/cache/apt/archives/mysql-server-*.deb

#To fix broken packages
sudo apt-get install -f
sudo dpkg --configure -a

#to install and re-install previous application
sudo apt-get install --reinstall mysql-server-8.0


#to start the service
sudo service mysql start

#to get the status
sudo systemctl status mysql --no-pager

echo "The server will up and running for 1 minute before it gets terminated"


sleep 1m


#command to stop mysql server
sudo service mysql stop


#to get the status
sudo systemctl status mysql --no-pager

echo "Wait for 1 minute to uninstall mysql from your linux system"

sleep 1m

sudo apt remove mysql-server mysql-client
sudo apt autoremove
sudo apt autoclean
