BINARY query staking validators --limit 1000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_BONDED") | [ (.tokens|tonumber / pow(10; 6)), .description.moniker ] | @csv' | column -t -s"," | sort -k1 -n -r | nl
