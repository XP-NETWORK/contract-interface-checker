# contract-interface-checker
A Solidity contract checking the supported interfaces of an unverified contract.

## Deployed contracts

|Chain|Address|
|:-:|:-:|
|Velas|0xaB9eD7b9734471249255B4d969B32995015116d9|

## Usage

1. Deploy a contract on a chain of interes
2. Call the `whatInterface` function. Pass the `address` of the contract of interest
3. Catch the events of the contract you deployed
4. Decode the events

## Example:

Velas TX [0xbbc9a213e3f6a69b49418c86fe4f88336c03444a8df761da782ce874ceb78724](https://evmexplorer.velas.com/tx/0xbbc9a213e3f6a69b49418c86fe4f88336c03444a8df761da782ce874ceb78724)

## Decoded Output

```json
[
	{
		"from": "0xaB9eD7b9734471249255B4d969B32995015116d9",
		"topic": "0x1ee05c1358ca3e73c866ffe1043b2174ee2ba5e62a2a658e5539f2a8a3a25ec7",
		"event": "SupportsInterface",
		"args": {
			"0": "0x20AB7a2678b6911b71B2d464661EBD2540f39da6",
			"1": "0xd9b67a26",
			"2": "ERC1155",
			"_addr": "0x20AB7a2678b6911b71B2d464661EBD2540f39da6",
			"_interface": "0xd9b67a26",
			"name": "ERC1155"
		}
	},
	{
		"from": "0xaB9eD7b9734471249255B4d969B32995015116d9",
		"topic": "0x1ee05c1358ca3e73c866ffe1043b2174ee2ba5e62a2a658e5539f2a8a3a25ec7",
		"event": "SupportsInterface",
		"args": {
			"0": "0x20AB7a2678b6911b71B2d464661EBD2540f39da6",
			"1": "0x0e89341c",
			"2": "ERC1155MetadataURI",
			"_addr": "0x20AB7a2678b6911b71B2d464661EBD2540f39da6",
			"_interface": "0x0e89341c",
			"name": "ERC1155MetadataURI"
		}
	},
	{
		"from": "0xaB9eD7b9734471249255B4d969B32995015116d9",
		"topic": "0x1ee05c1358ca3e73c866ffe1043b2174ee2ba5e62a2a658e5539f2a8a3a25ec7",
		"event": "SupportsInterface",
		"args": {
			"0": "0x20AB7a2678b6911b71B2d464661EBD2540f39da6",
			"1": "0x01ffc9a7",
			"2": "ERC165",
			"_addr": "0x20AB7a2678b6911b71B2d464661EBD2540f39da6",
			"_interface": "0x01ffc9a7",
			"name": "ERC165"
		}
	}
]
```
