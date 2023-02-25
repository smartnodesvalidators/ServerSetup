#!/bin/sh
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update -y
sudo apt-get install git make wget curl unzip jq lz4 -y
sudo apt-get install fail2ban -y
sudo apt-get install mlocate -y
# sudo apt install net-tools open-vm-tools -y
sudo updatedb

sudo su -c "echo 'fs.file-max = 65536' >> /etc/sysctl.conf"
sudo su -c "echo '* hard nofile 94000' >> /etc/security/limits.conf"
sudo su -c "echo '* soft nofile 94000' >> /etc/security/limits.conf"
sudo su -c "echo 'session required pam_limits.so' >> /etc/pam.d/common-session"
sudo sysctl -p

echo 'export GOROOT=/usr/local/go' >> $HOME/.bashrc
echo 'export GOPATH=${HOME}/go' >> $HOME/.bashrc
echo 'export GOBIN=$GOPATH/bin' >> $HOME/.bashrc
echo 'export export GO111MODULE=on' >> $HOME/.bashrc
echo 'export PATH=${PATH}:${GOROOT}/bin:${GOBIN}' >> $HOME/.bashrc

source ${HOME}/.bashrc

mkdir $HOME/scripts
cd $HOME/scripts
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/blockheight.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/checkconsensus.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/checknode.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/checksync.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/claimtokens.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/compilepeerlist.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/f2b.ssh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/fw.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/getdelegates.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/getpeerinfo.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/listpeers.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/sendtokens.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/ssh.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/upgradego.sh
wget https://raw.githubusercontent.com/smartnodesvalidators/ServerSetup/main/validatorsvoting.sh
mv $HOME/scripts/f2b.ssh $HOME/scripts/f2b.sh
chmod u+x *

cd $HOME
wget https://go.dev/dl/go1.19.6.linux-amd64.tar.gz
sudo tar -xvf go1.19.6.linux-amd64.tar.gz
sudo mv go /usr/local
