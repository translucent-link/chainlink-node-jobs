# Get > Uint256

This job retrieves a `uint256` integer from a internet-facing JSON API.

## Contract Address & JobID
  
Contract: [0x1314E350Fc5a3896E2d66C43A83D9391E914a004](https://mumbai.polygonscan.com/address/0x1314E350Fc5a3896E2d66C43A83D9391E914a004)

JobID: 9ee6d657668a4ccfaaab03b73c703fc6

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the integer is retrieved
* `path` - comma-separated JSON path used to extract the integer value
* `multiply` - factor using to deal with precision and rounding errors

Note: use commas not dots for JSON paths.

## Price

0.05 LINK

## Example

If you set the following parameters

* get : https://min-api.cryptocompare.com/data/pricemultifull?fsyms=ETH&tsyms=USD
* path : RAW,ETH,USD,PRICE
* price : 100

Note: use commas not dots for JSON paths.

You will receive a JSON response that may look like this:

    {
      "RAW": {
        "ETH": {
          "USD": {
            "PRICE": 2045.32
          }
        }
      }
    }

The job populated with the example parameters above would return with: `204532`

See [example.sol](example.sol) for an example client contract.
