appics.token
-----------

The contract has standard eosio.token functionality except for a few features:
1. Contract releases a new tokens by function **mint**, wrapper for isssue which additionally takes steem transaction id.  
```void token::mint( name to, asset quantity, string steem_tx, string memo )```

2. When tokens are received on the contract itself, they will be burned. It is assumed that the tokens are transferred to the STEEM network, to the account located in memo.



## Build
```
make build
```

## Deploy 
Edit the Makefile according to your data.

```
make buy_ram
make deploy
```
