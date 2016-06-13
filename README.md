# Image Compressor Pack

A source distribution of a bunch of lossy and lossless image optimisation
utilities for use with `image_optim`. Created because I didn't trust the
binaries in the `image_optim_pack` gem and wanted something to automate the
compilation from source.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_compressor_pack', github: 'ignisf/image_compressor_pack'
```

And then execute:

    $ bundle

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
