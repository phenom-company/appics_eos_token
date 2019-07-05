wallet_pasword=
cleos_path=cleos -u http://jungle2.cryptolions.io:80
source_path=$(PWD)
contract=testapxtoken

unlock_wallet:
	$(cleos_path) wallet unlock --password $(wallet_pasword)

import_keys:
	$(cleos_path) wallet import --private-key 5Jg7y...

build:
	eosio-cpp -w -I ./include --abigen $(source_path)/src/eosio.token.cpp -o $(source_path)/eosio.token.wasm

buy_ram:
	$(cleos_path) system buyram $(contract) $(contract) --kbytes 500

deploy:
	$(cleos_path) set contract $(contract) $(source_path) eosio.token.wasm eosio.token.abi -p $(contract)@active
	$(cleos_path) set account permission $(contract) active --add-code
