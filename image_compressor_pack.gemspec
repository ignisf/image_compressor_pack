# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_compressor_pack/version'

Gem::Specification.new do |spec|
  spec.name          = "image_compressor_pack"
  spec.version       = ImageCompressorPack::VERSION
  spec.authors       = ["Petko Bordjukov"]
  spec.email         = ["bordjukov@gmail.com"]
  spec.cert_chain    = ['certs/ignisf.pem']
  spec.signing_key   = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/ and ENV['TRAVIS'] != "true"

  spec.summary       = %q{A distribution of image optimization utilities.}
  spec.description   = %q{This gem packs a bunch of useful utilities for image optimization for use with image_optim.}
  spec.homepage      = "https://github.com/ignisf/image_compressor_pack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|release|bin)/}) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/image_compressor_pack/extconf.rb"]

  spec.add_runtime_dependency "mini_portile2", "~> 2"

  spec.add_development_dependency "bundler", "~> 1"
  spec.add_development_dependency "rake", "~> 11"
  spec.add_development_dependency 'image_optim', '~> 0'
  spec.add_development_dependency 'rspec', '~> 3'
end
