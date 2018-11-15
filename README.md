# Scim-latex-tables

Scim-latex-tables is a vim plugin that generates Latex tables using [sc-im](https://github.com/andmarti1424/sc-im), an excel-like spreadsheet program for the terminal emulator.

I wrote this vim plugin for personal use, since writing Latex tables is a huge pain. You can find it useful too if you use Vim as your text editor for `.tex` files and have to write tables in your documents regularly.


## Usage

Type 'newTable' or 'importTable' (if you want to import an existing 'csv' file as a table) where you want your table to be. [Sc-im](https://github.com/andmarti1424/sc-im) will open up in your terminal emulator running Vim. Create/edit your table, save the file and exit [sc-im](https://github.com/andmarti1424/sc-im) just like you would normally do in Vim, `:w` and `:q`. Then a full tex-formatted table will appear in your document. You just have to fill in the caption, label and tabular gaps.

## Demo

![Demo](http://mural.uv.es/mababue/slt2.gif)

## Dependencies

- [sc-im](https://github.com/andmarti1424/sc-im)
- sed (This package is usually installed by default in almost every Linux distribution)

## Installation

Just stick `scim-latex-tables.vim` in your `plugin/` directory.
