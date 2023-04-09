# Get > Bool

This job retrieves a `bool` from a internet-facing JSON API.

## Contract Address & JobID
  
Contract: [0x78075387A6ef71FE0F036f22f1Dc6Ea68C9c3FA1](https://arbiscan.io/address/0x78075387A6ef71FE0F036f22f1Dc6Ea68C9c3FA1)

JobID: a75ebb6e5a7b492fbfb67ab240100a95

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path` - comma-separated JSON path used to extract the integer value

Note: use commas not dots for JSON paths.

## Price

0.05 LINK

## Example

If you set the following parameters

* get : https://raw.githubusercontent.com/translucent-link/chainlink-node-jobs/main/abitrum/Get%20%3E%20Bool/example.json
* path : values,trueValue

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
      "values": {
        "trueValue": true,
        "falseValue": false
      }
    }

The job populated with the example parameters above would return with: `true`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 
