wallet_pasword=pswd
cleos_path=cleos -u https://api.eosnewyork.io
source_path=$(PWD)
contract=appicsappics

unlock_wallet:
	$(cleos_path) wallet unlock --password $(wallet_pasword)

import_keys:
	$(cleos_path) wallet import --private-key 5Jg7y...

build:
	eosio-cpp -w -I ./include --abigen $(source_path)/src/eosio.token.cpp -o $(source_path)/eosio.token.wasm

buy_ram:
	$(cleos_path) system buyram $(contract) $(contract) --kbytes 350

deploy:
	$(cleos_path) set contract $(contract) $(source_path) eosio.token.wasm eosio.token.abi -p $(contract)@active
	$(cleos_path) set account permission $(contract) active --add-code
