watch -n 0.08 "curl -s localhost:26657/status | jq -r .result.sync_info.latest_block_height; curl -s localhost:26657/consensus_state | jq -r '.result.round_state.height_vote_set[0] | (.prevotes_bit_array, .precommits_bit_array)'"