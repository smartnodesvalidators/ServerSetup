PEERS=$(curl https://raw.githubusercontent.com/cerberus-zone/cerberus/main/networks/mainnet/peers.txt | head -n 10 | sed 's/$/,/' | tr -d '\n' | sed '$ s/.$//'); sed "s/persistent_peers = \"\"/persistent_peers = $PEERS/" ~/.cerberusd/config/config.toml -i
