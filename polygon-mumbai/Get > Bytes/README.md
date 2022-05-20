# Get > Bytes

This job retrieves a variable-length string from an internet-facing JSON API.

## Contract Address & JobID

Contract: [0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434](https://mumbai.polygonscan.com/address/0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434)

JobID: a84b561bd8f64300a0832682f208321f

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
