# Get > Uint256

This job retrieves a `uint256` integer from a internet-facing JSON API.

## Contract Address & JobID
  
Contract: [0x4246103C6fF2e3eC839751156b518d066aab5e5A](https://testnet.bscscan.com/address/0x4246103C6fF2e3eC839751156b518d066aab5e5A)

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
* multiply : 100

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

## Troubleshooting

1. Please make sure you load your client contract, e.g. example.sol, with enough LINK, otherwise you'll get a "Gas estimation failed" error.
2. The contract address and jobId mentioned above are specific to the network and won't work on other networks.
3. Please find us in our [Discord](https://discord.gg/JxKT6R9Xpz) if you're stuck and needing help. 