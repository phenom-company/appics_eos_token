# EOS APX Token Contract
![Appics.token](https://steemitimages.com/640x0/https://cdn.steemitimages.com/DQmdPCVVadHgHSzGa7JGSYuzrVSBFnkT69XgC4Jd1HKaEB2/2019-06-25%2017.32.44.jpg)  

This contract provides binding of APX token from STEEM network to EOS network.

## Properties
The contract has the functionality of extended **eosio.token** of the contract.

### Mint tokens
Contract releases a new tokens by action **mint**: wrapper for isssue which additionally takes steem transaction id.  
```c++
void token::mint( name to, asset quantity, string steem_tx, string memo )
```

### Burning tokens
When tokens are received on the contract itself, they will be burned and swapped to Steem account specified in memo. This happens in the **transfer** action.

```c++
    if ( to == _self ) {
       // If tokens are transferred to the contract account,
       // they are automatically burned and swapped to Steem account specified in memo.

       sub_balance( from, quantity );
       statstable.modify( st, same_payer, [&]( auto& s ) {
          s.supply -= quantity;
       });

       return;
    }

```


## Build
Building a contract requires eosio-cpp version 1.6.1 or higher.

```
eosio-cpp -w -I ./include --abigen $(PWD)/src/eosio.token.cpp -o $(PWD)/eosio.token.wasm

# or by Makefile
make build
```

## Deploy 
Edit the Makefile according to your data.

```bash
wallet_pasword=pswd      # Cleos wallet password for unlock
cleos_path=cleos         # Cleos path
source_path=$(PWD)       # Contract directory
contract=account         # Contract account name

```

The contract requires 350 kilobytes of RAM.
```
# Buy 350 kilobytes of RAM
make buy_ram
```

Command will deploy contract and set permission **eosio.code** required for execute inline actions.
```
make deploy 
```
