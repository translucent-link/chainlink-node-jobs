# IPFS > Uint256

This job retrieves a `uint256` integer from an IPFS content source identified by a content identifier.

## Contract Address & JobID
  
Contract: [0x2362A262148518Ce69600Cc5a6032aC8391233f5](https://sepolia.etherscan.io/address/0x2362A262148518Ce69600Cc5a6032aC8391233f5)

JobID: 4ef8208335f443ce9dc2829fe9215579

## Parameters

The job requires the following parameters to be specified:

* `cid` - the content identifier of the piece of content you're retrieving from IPFS
* `path` - comma-separated JSON path used to extract the integer value
* `multiply` - factor using to deal with precision and rounding errors

Note: use commas not dots for JSON paths.

## Price

0 LINK

## Example

If you set the following parameters

* cid : bafybeiaeplypj7ah7rqktt5i5d5zxtgbiuh4jmniqz75qmpjcevxpdn3d4
* path : result,eth_balance
* multiply : 100

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

The job populated with the example parameters above would return with: `15`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 