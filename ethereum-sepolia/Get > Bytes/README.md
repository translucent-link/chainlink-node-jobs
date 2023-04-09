# Get > Bytes

This job retrieves a variable-length string from an internet-facing JSON API.

## Contract Address & JobID

Contract: [0x2362A262148518Ce69600Cc5a6032aC8391233f5](https://sepolia.etherscan.io/address/0x2362A262148518Ce69600Cc5a6032aC8391233f5)

JobID: a84b561bd8f64300a0832682f208321f

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the bytes/string is retrieved
* `path` - comma-separated JSON path used to extract the integer value

## Price

0 LINK

## Example

If you set the following parameters

* get : https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD
* path : RAW,ETH,USD,IMAGEURL

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
      "RAW": {
        "ETH": {
          "USD": {
            "IMAGEURL": "/media/37746238/eth.png"
          }
        }
      }
    }

The job populated with the example parameters above would return with: `/media/37746238/eth.png`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 