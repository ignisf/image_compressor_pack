# Crunch

A source distribution of a bunch of lossy and lossless image optimisation
utilities for use with `image_optim`. Created because I didn't trust the
binaries in the `image_optim_pack` gem and wanted something to automate the
compilation from source.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'crunch', github: 'ignisf/crunch'
```

And then execute:

    $ bundle

## Usage

For use in Rails with `image_optim`. Just adding it to your `Gemfile` should be
enough to add most of the utilities `image_optim` has workers for to the `PATH`.

At this point `image_optim_pack` supports `svgo` and `pngout` which are not
included in `crunch`. `svgo` requires nodejs and `pngout`'s source is not open.

To exclude them, use the following in your Rails environment configuration or
appropriate initialiser:

```ruby
config.assets.image_optim = {skip_missing_workers: true,
                             svgo: false,
                             pngout: false}
```

See https://github.com/toy/image_optim#from-rails for more info on Rails
configuration or https://github.com/toy/image_optim#configuration if you are
using `image_optim` and `crunch` outside of Rails.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
