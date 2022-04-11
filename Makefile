compile:; forge build --force

deploy-contract:; 
	forge create $(contract) \
	--constructor-args $(constructorArgs) \
	--rpc-url $(url) \
	--private-key $(privateKey)


# Verification
verify-contract:; 
	forge verify-contract \
	--chain-id $(chainId) \
	--constructor-args `cast abi-encode "$(constructorSig)" $(constructorArgs)` \
	--compiler-version $(compilerVersion) \
	--num-of-optimizations 200 \
	$(address) \
	$(contract) \
	$(apiKey) 
