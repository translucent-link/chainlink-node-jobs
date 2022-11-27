# Get > Uint256[]

This job retrieves a list or array of `uint256` integers from a internet-facing JSON API.

## Contract Address & JobID

Contract: [0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434](https://goerli.etherscan.io/address/0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434)

JobID: b25b7d28184a4f4d8dd33009bbeda4e1

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path` - comma-separated JSON path used to extract the bytes[] values

Note: use commas not dots for JSON paths.

## Price

0 LINK

## Example

If you set the following parameters

* get : https://raw.githubusercontent.com/translucent-link/chainlink-node-jobs/main/ethereum-goerli/Get%20%3E%20Uint256%5B%5D/example.json
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