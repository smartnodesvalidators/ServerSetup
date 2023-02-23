sudo sed -i "s/#Port 22/Port 1609/" /etc/ssh/sshd_config
sudo sed -i "s/Port 22/Port 1609/" /etc/ssh/sshd_config
sudo service ssh restart