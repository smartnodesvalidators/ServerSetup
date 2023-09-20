#!/bin/sh
sudo ufw allow 1609/tcp
sudo ufw allow 1317/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 26657/tcp
sudo ufw allow 9100/tcp
sudo ufw allow 26660/tcp
sudo systemctl enable ufw
sudo systemctl start ufw
