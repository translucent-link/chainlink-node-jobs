# Get > Uint256

This job retrieves a `uint256` integer from a internet-facing JSON API.

## Contract Address & JobID
  
Contract: [0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434](https://mumbai.polygonscan.com/address/0x188b71C9d27cDeE01B9b0dfF5C1aff62E8D6F434)

JobID: 7599d3c8f31e4ce78ad2b790cbcfc673

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
