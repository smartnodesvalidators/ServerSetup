#!/bin/sh
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update -y
sudo apt-get install -y git golang-go make wget -y
sudo apt-get install fail2ban -y
sudo apt-get install mlocate
sudo updatedb
