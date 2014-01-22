# Barcodes

The purpose of this module is to *demonstrate* how easy it is to generate barcodes for austrian supermarket club cards.
Therefore the names of the vendors are anonymized.

## Installation

```bash
npm install supermarket-barcodes
```

## Sample Usage

How to generate "a few" barcodes from Vendor3:

```js
var barcodes = require('supermarket-barcodes');
var rescode = require('rescode');

rescode.loadModules(['ean2', 'ean5', 'ean8', 'ean13']);

for (var i = 3200000; i <= 3217000; i++) {
  vendor = new barcodes.Vendor3(i);
  console.log("Customer ID:\t " + vendor.customerID);
  console.log("Code:\t " + vendor.code);
  console.log("Checksum:\t " + vendor.checkSum);
  fs.writeFile(vendor.customerID + ".png", rescode.create('ean13', vendor.code), function() {
    console.log('Barcode  written');
  });
}
```

## Build

You need node.js and git installed on your machine.

```bash
git clone git@github.com:boennemann/barcodes.git
npm install
npm install -g grunt-cli
grunt
```

## Attribution

The code is based on [nocard.info](https://nocard.info/).
