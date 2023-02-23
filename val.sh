#!/bin/sh
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update -y
sudo apt-get install git golang-go make wget curl unzip jq lz4 -y
sudo apt-get install fail2ban -y
sudo apt-get install mlocate
sudo updatedb

sudo su -c "echo 'fs.file-max = 65536' >> /etc/sysctl.conf"
sudo su -c "echo '* hard nofile 94000' >> /etc/security/limits.conf"
sudo su -c "echo '* soft nofile 94000' >> /etc/security/limits.conf"
sudo su -c "echo 'session required pam_limits.so' >> /etc/pam.d/common-session"
sudo sysctl -p

export GOROOT=/usr/lib/go
export GOPATH=${HOME}/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on
export PATH=${PATH}:${GOROOT}/bin:${GOBIN}

echo 'export GOROOT=/usr/lib/go' >> $HOME/.bashrc
echo 'export GOPATH=${HOME}/go' >> $HOME/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> $HOME/.bashrc
echo 'export export GO111MODULE=on' >> $HOME/.bashrc
echo 'export PATH=${PATH}:${GOROOT}/bin:${GOBIN}' >> $HOME/.bashrc
