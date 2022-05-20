# Get > Uint256[]

This job retrieves a list or array of `uint256` integers from a internet-facing JSON API.

## Contract Address & JobID

Contract: [0x1314E350Fc5a3896E2d66C43A83D9391E914a004](https://mumbai.polygonscan.com/address/0x1314E350Fc5a3896E2d66C43A83D9391E914a004)

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

* get : https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD
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
