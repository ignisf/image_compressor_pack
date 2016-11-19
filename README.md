# Image Compressor Pack
[![Gem Version](https://badge.fury.io/rb/image_compressor_pack.svg)](https://badge.fury.io/rb/image_compressor_pack)
[![Build Status](https://travis-ci.org/ignisf/image_compressor_pack.svg?branch=master)](https://travis-ci.org/ignisf/image_compressor_pack)

A source distribution of a bunch of lossy and lossless image optimisation
utilities for use with `image_optim`. Created because I didn't trust the
binaries in the `image_optim_pack` gem and wanted something to automate the
compilation from source.

## Installation

The gem is distributed in both source and binary form. The binary version
contain statically linked executables for Linux and FreeBSD and dynamically
linked ones for Mac OS X.

### Using the gem

Add this line to your application's Gemfile:

```ruby
gem 'image_compressor_pack'
```

And then execute:

    $ bundle

### Versioning

Starting with `image_compressor_pack` `1.0.0.0`, all even point releases contain
only a source-based distribution, while odd point releases contain both a
source-based distribution *and* binary distributions. However both point
releases correspond to the *exact* underlying code. The only difference is the
version number.

This way, the most recent version of the gem always has binary distributions,
but if you don't want to use the binaries, you can always "lock in" your
dependency a single point version down, forcing it to compile from source.

So for example, `1.0.0.1` contains all the binary distributions, while `1.0.0.0`
is the exact same code, but contain only a source-based distribution.

## Usage

For use in Rails with `image_optim`. Just adding it to your `Gemfile` should be
enough to add most of the utilities `image_optim` has workers for to the `PATH`.

At this point `image_optim_pack` supports `svgo` and `pngout` which are not
included in `image_compressor_pack`. `svgo` requires nodejs and `pngout`'s
source is not open.

To exclude them, use the following in your Rails environment configuration or
appropriate initialiser:

```ruby
config.assets.image_optim = {skip_missing_workers: true,
                             svgo: false,
                             pngout: false}
```

See https://github.com/toy/image_optim#from-rails for more info on Rails
configuration or https://github.com/toy/image_optim#configuration if you are
using `image_optim` and `image_compressor_pack` outside of Rails.

## Note on the security of this gem

The packaged utilities are pretty niche and I wouldn't use them on images from
untrusted parties. Do so on your own responsibility.

The .gem files I produce on trusted systems are signed with the certificate in
the `certs` directory. There's an OpenPGP signature there, too. It can be used
to tie the x509 certificate to my OpenPGP web of trust. See
[this](http://guides.rubygems.org/security/) for more info on verifying gem
signatures.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
