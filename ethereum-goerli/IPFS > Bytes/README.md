# Get > Bytes

This job retrieves a variable-length string from an IPFS content source identified by a content identifier.

## Contract Address & JobID

Contract: [0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434](https://goerli.etherscan.io/address/0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434)

JobID: 451e324825544887b9f0eedc171d4423

## Parameters

The job requires the following parameters to be specified:

* `cid` - the content identifier of the piece of content you're retrieving from IPFS
* `path` - comma-separated JSON path used to extract the integer value

## Price

0 LINK

## Example

If you set the following parameters

* cid : bafybeiaeplypj7ah7rqktt5i5d5zxtgbiuh4jmniqz75qmpjcevxpdn3d4
* path : result,firstname

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

The job populated with the example parameters above would return with: `Ijonas`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 