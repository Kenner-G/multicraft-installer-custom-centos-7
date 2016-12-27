#!/bin/bash

#/**
# *
# *   Copyright © 2010-2016 by MegaByteHosting, BlueLeafHosting, DavidBrockway All rights reserved.
# *   This script is inteneded for the use of megabytehosting and blueleafhosting but you may with to use it we do not give 
# *   support to anyone who used this script. We hope you like it use it at your own risk!
# *   
# *
# **/

echo
echo "***"
echo "*** Welcome to Multicraft 7 centos install script! (Custom)"
echo "***"
echo
echo "This installer will help you get Multicraft up and running also install all the packages and dependencies."
echo "No changes are made to the system until all of the required information has been collected."
echo
echo "NOTE: This script automates the installation as described on the Multicraft website. Use it at your own risk."
echo "Custom coded and edited by David Brockway."
echo
echo

echo "updating centos OS"

 sleep 1

  yum -y update



echo "Installing httpd, unzip, zip"
 sleep 1
   yum -y install httpd unzip zip nano


echo "Starting Apache"
 sleep 1
  sudo systemctl start httpd
  
echo "Enabling Apache"
 sleep 1
  sudo systemctl enable httpd
  
echo "Checking the status of Apache"
 sleep 1
  sudo Checking the status of Apache
  
echo "Apache has been isnatlled now installing Mysql-mariadb"
 sleep 1
  sudo yum -y install mariadb-server mariadb
  
echo "Starting Mysql-mariadb"
 sleep 1
  sudo systemctl start mariadb

echo "Enabling Mysql-mariadb"
 sleep 1
  sudo systemctl enable mariadb

echo "Checking the status of Mysql-mariadb"
 sleep 1
  sudo systemctl status mariadb
  
echo "Starting Mysql-mariadb secure setup, user should enter the details they want for the MYSQL Server"
 sleep 1
  sudo sudo mysql_secure_installation
  
echo "MYSQL Servers has been installed now installing PhpMyAdmin"
 sleep 1
  yum install epel-release
  yum install phpmyadmin

echo "PhpMyAdmin have been installed now Add # to Require ip 127.0.0.1 and Require ip ::1
Add Require all granted. Then save. Ctrl + X then Y then [Enter]"
 sleep 5
  sudo nano /etc/httpd/conf.d/phpMyAdmin.conf

echo "Installing dependencies"
 sleep 1
  yum install php php-mysql php-gd php-pear php-common php-mbstring php-ldap php-odbc php-xml php-xmlrpc php-bcmath php-mysql php-pdo wget vim tar zip curl java-1.8.0-openjdk
  yum install httpd php php-common php-gd php-mbstring php-ldap php-odbc php-pear php-xml php-xmlrpc php-bcmath php-mysql php-pdo wget vim tar zip curl java-1.8.0-openjdk

echo "dependencies have been installed now restarting Apache"
 sleep 2
  sudo systemctl restart httpd.service

echo "You now need to Replace All: AllowOverride None with AllowOverride All. (Total 4 to change)
Then save. Ctrl + X then Y then [Enter]
"
 sleep 5
  sudo nano /etc/httpd/conf/httpd.conf


echo "Restarting apache"
 sleep 1
  sudo systemctl restart httpd.service


echo "Disabling setenforce"
 sleep 1
  sudo  setenforce 0
  
echo "Downloading Multicraft"
 sleep 1
  wget --content-disposition http://www.multicraft.org/download/index?arch=linux64


echo "Extracting multicraft"
 sleep 2
  tar -xzf multicraft*.tar.gz


    cd multicraft/



echo "Running multicraft install script"
 sleep 4
  sudo ./setup.sh

echo "Now Create Database
Open Internet Browser and go to http://your_server_ip/Phpmyadmin, then Login with Username: root Password: Your created (MySQL) password.
Open Tab database tab in phpmyadmin. Then create database: multicraft_panel and multicraft_daemon"
 sleep 1

echo "Multicraft Install.php
Continue the setup in http://your_server_ip/html/multicraft/install.php"
 sleep 4
 
echo "Multicraft Install.php instructions, 
1. Press Continue.
2. Press Continue Again if Configuration File Found.
3. Setup the Panel MySQL - View Press Save, Then Initialize Database, ThenContinue.
4. Login using username: admin password: admin
5. Setup the Daemon MySQL - View Press Save, Then Initialize Database, Then Continue.
6. In Basic Configuration go to Password for daemon connections and Enter the password you created for the Daemon in Step:9-10 Default Password: none
7. Press Save and Continue.
8. Open Terminal - (PuTTy) and start the Daemon(s)."
 sleep 5

echo "Starting multicraft daemon"
 sleep 1
  sudo /home/minecraft/multicraft/bin/multicraft start

  

