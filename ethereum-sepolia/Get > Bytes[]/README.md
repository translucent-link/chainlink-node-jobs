# Get > Bytes[]

This job retrieves a list or array of `bytes` (strings) from a internet-facing JSON API.

## Contract Address & JobID

Contract: [0x2362A262148518Ce69600Cc5a6032aC8391233f5](https://sepolia.etherscan.io/address/0x2362A262148518Ce69600Cc5a6032aC8391233f5)

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

* get : https://raw.githubusercontent.com/translucent-link/chainlink-node-jobs/main/ethereum-sepolia/Get%20%3E%20Bytes%5B%5D/example.json
* path : calendar,months

You will receive a JSON response that may look like this:

    {
      "calendar": {
        "months": [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December"
        ]
      }
    }

The job populated with the example parameters above would return with: `[January, February.... December]`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. You can convert `bytes` to `string` using `const str = string(mybytes);` 
2. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
3. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
4. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 