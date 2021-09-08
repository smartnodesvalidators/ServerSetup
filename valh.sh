#!/bin/sh
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update -y
sudo apt-get install -y git golang-go make wget build-essentials -y
sudo apt-get install fail2ban -y
sudo apt-get install mlocate -y
sudo apt-get install linux-virtual linux-cloud-tools-virtual linux-tools-virtual -y
sudo updatedb

sudo dpkg-reconfigure tzdata

sudo su -c "echo 'export GOROOT=/usr/lib/go' >> $HOME/.bashrc"
sudo su -c "echo 'export GOPATH=${HOME}/go' >> $HOME/.bashrc"
sudo su -c "echo 'export GOBIN=$GOPATH/bin' >> $HOME/.bashrc"
sudo su -c "echo 'export PATH=${PATH}:${GOROOT}/bin:${GOBIN}' >> $HOME/.bashrc"
sudo su -c "echo 'fs.file-max = 65536' >> /etc/sysctl.conf"
sudo su -c "echo '* hard nofile 94000' >> /etc/security/limits.conf"
sudo su -c "echo '* soft nofile 94000' >> /etc/security/limits.conf"
sudo su -c "echo 'session required pam_limits.so' >> /etc/pam.d/common-session"
sudo su -c "echo 'hv_vmbus' >> /etc/initramfs-tools/modules"
sudo su -c "echo 'hv_storvsc' >> /etc/initramfs-tools/modules"
sudo su -c "echo 'hv_blkvsc' >> /etc/initramfs-tools/modules"
sudo su -c "echo 'hv_netvsc' >> /etc/initramfs-tools/modules"
sudo sysctl -p
sudo update-initramfs -u