# Get > Uint256,Uint256

This job retrieves two `uint256` integers from a internet-facing JSON API.

## Contract Address & JobID
  
Contract: [0xf71775b3640D7034466e0321E35c5CFB78fd212F](https://kovan.etherscan.io/address/0xf71775b3640D7034466e0321E35c5CFB78fd212F)

JobID: 437d298d210c4fff935dcedb97ea8011

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path1` - comma-separated JSON path used to extract the first integer value
* `path2` - comma-separated JSON path used to extract the second integer value
* `multiply` - factor using to deal with precision and rounding errors

Note: use commas not dots for JSON paths.

## Price

0.05 LINK

## Example

If you set the following parameters

* get : https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD
* path1 : RAW,ETH,USD,HIGHDAY
* path2 : RAW,ETH,USD,LOWDAY
* multiply : 100

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
      "RAW": {
        "ETH": {
          "USD": {
            "HIGHDAY": 2061.81,
            "LOWDAY": 2000.51
          }
        }
      }
    }

The job populated with the example parameters above would return with: `206181` & `200051`

See [example.sol](example.sol) for an example client contract.

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 