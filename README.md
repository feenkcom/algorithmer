# Algorithmer
A tool for visual construction of algorithms and their export to various languages

## Installation

Requires [Glamorous Toolkit](https://gtoolkit.com/download/ "Download GToolkit").

```smalltalk
Metacello new
   baseline: 'GToolkitAlgorithmer';
   repository: 'github://feenkcom/gtoolkit-algorithmer:main/src';
   load.
```

### Examples
Here is a classic `fizzbuzz` algorithm visualised in `algorithmer`:
![Fizzbuzz in algorithmer](https://github.com/feenkcom/gtoolkit-algorithmer/raw/main/screenshots/algorithmer.png)

### Export
Algorithms can be exported to various programming languages.

#### Export to Pharo
![Export to Pharo](https://github.com/feenkcom/gtoolkit-algorithmer/raw/main/screenshots/export-pharo.png)

#### Export to Rust
![Export to Rust](https://github.com/feenkcom/gtoolkit-algorithmer/raw/main/screenshots/export-rust.png)
