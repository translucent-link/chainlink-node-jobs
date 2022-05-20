# Get > Bytes

This job retrieves a variable-length string from an internet-facing JSON API.

## Contract Address & JobID

Contract: [0x1314E350Fc5a3896E2d66C43A83D9391E914a004](https://mumbai.polygonscan.com/address/0x1314E350Fc5a3896E2d66C43A83D9391E914a004)

JobID: 490d815cbbb74a0db1d17e7aae3deb84

## Parameters

The job requires the following parameters to be specified:

* `get` - internet-facing URL from where the bytes/string is retrieved
* `path` - comma-separated JSON path used to extract the integer value

## Price

0.05 LINK

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
