# Crunch

A source distribution of a bunch of lossy and lossless image optimisation
utilities for use with `image_optim`. Created because I didn't trust the
binaries in the `image_optim_pack` gem and wanted something to automate the
compilation from source.

## Installation

Install `nasm`, and the respective development packages of `libpng` and
`libjpeg`. On Debian-based distros they're called `libpng-dev` and
`libjpeg-dev`.

Add this line to your application's Gemfile:

```ruby
gem 'crunch', github: 'ignisf/crunch'
```

And then execute:

    $ bundle

## Usage

For use in Rails with `image_optim`. Just adding it to your `Gemfile` should be
enough to add most of the utilities `image_optim` has workers for to the `PATH`.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
