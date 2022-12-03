# IPFS > Uint256,Uint256

This job retrieves two `uint256` integers from an IPFS content source identified by a content identifier.

## Contract Address & JobID
  
Contract: [0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434](https://etherscan.io/address/0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434)

JobID: 15a194f8577b4baf9c937f07cb65e33c

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path1` - comma-separated JSON path used to extract the first integer value
* `path2` - comma-separated JSON path used to extract the second integer value
* `multiply1` - factor using to deal with precision and rounding errors applied to the number at then end of `path1`
* `multiply2` - factor using to deal with precision and rounding errors applied to the number at then end of `path2`

Note: use commas not dots for JSON paths.

## Price

1.36 LINK

## Example

If you set the following parameters

* cid : bafybeiaeplypj7ah7rqktt5i5d5zxtgbiuh4jmniqz75qmpjcevxpdn3d4
* path1 : result,age
* path2 : result,eth_balance
* multiply1 : 1
* multiply2 : 100

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
      "jobRunID": 1,
      "result": {
        "firstname": "Ijonas",
        "surname": "Kisselbach",
        "age": 50,
        "eth_balance": 0.15,
        "nice_person": true
      },
      "statusCode": 200,
      "data": {
        "result": {
          "firstname": "Ijonas",
          "surname": "Kisselbach",
          "age": 50,
          "eth_balance": 0.15,
          "nice_person": true
        }
      }
    }

The job populated with the example parameters above would return with: `50`, and `15` respectively.

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 