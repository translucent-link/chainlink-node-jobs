# Get > Uint256[]

This job retrieves a list or array of `uint256` integers from a internet-facing JSON API.

## Contract Address & JobID

Contract: [0x4246103C6fF2e3eC839751156b518d066aab5e5A](https://testnet.bscscan.com/address/0x4246103C6fF2e3eC839751156b518d066aab5e5A)

JobID: a56c23c069b446a5bfd3b5fc91383991

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path` - comma-separated JSON path used to extract the integer value

Note: use commas not dots for JSON paths.

## Price

0.05 LINK

## Example

If you set the following parameters

* get : https://raw.githubusercontent.com/translucent-link/chainlink-node-jobs/main/polygon-mumbai/Get%20%3E%20Uint256%5B%5D/example.json
* path : RAW,ETH,USD,PRICES

You will receive a JSON response that may look like this:

    {
      "RAW": {
        "ETH": {
          "USD": {
            "PRICES": [2045.32, 2062.1, 1955.32, 2453.22]
          }
        }
      }
    }

The job populated with the example parameters above would return with: `[2045, 2062, 1955, 2453]`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 