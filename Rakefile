require 'bundler/gem_tasks'
require 'image_compressor_pack/recipes'

desc 'Compile all recipes'
task :compile do
  sh 'ruby ext/image_compressor_pack/extconf.rb'
end

module Helpers
  module_function

  def binary_gemspec(platform = Gem::Platform.local)
    gemspec = eval(File.read 'image_compressor_pack.gemspec')
    gemspec.platform = platform
    gemspec
  end

  def binary_gem_name(platform = Gem::Platform.local)
    File.basename binary_gemspec(platform).cache_file
  end
end

desc "Build #{Helpers.binary_gem_name} into the pkg directory"
task binary: :compile do
  gemspec = Helpers.binary_gemspec
  gemspec.extensions.clear
  gemspec.signing_key = File.expand_path("~/.ssh/gem-private_key.pem")

  # We don't need most things for the binary
  gemspec.files  = `git ls-files lib`.split("\n")
  gemspec.files += ['LICENSE.txt', File.join('lib', '.paths.yml')]
  gemspec.files += `git ls-files -o ports`.split("\n")

  FileUtils.mkdir_p 'pkg'

  package = if Gem::VERSION < '2.0.0'
    Gem::Builder.new(gemspec).build
  else
    require 'rubygems/package'
    Gem::Package.build gemspec
  end

  FileUtils.mv package, 'pkg'
end

task :clean do
  sh 'git clean -dxf -e .bundle -e vendor -e Gemfile.lock'
end

desc 'Download all recipe archives'
task :download do
  ImageCompressorPack.recipes.each(&:download)
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

namespace :build do
  ['x86_64-linux', 'x86-linux', 'x86_64-freebsd10'].each do |arch|
    desc "build binary gem for #{arch}"
    task arch do
      arch_dir = Pathname(__FILE__).dirname.join("release/#{arch}")
      Dir.chdir(arch_dir) do
        ENV['RUBYLIB'] = nil # https://github.com/mitchellh/vagrant/issues/6158
        sh "vagrant up"
        sh "vagrant ssh -c 'rm -rf ~/image_compressor_pack'"
        sh "vagrant ssh -c 'git clone /image_compressor_pack/.git ~/image_compressor_pack'"
        sh "vagrant ssh -c 'cd ~/image_compressor_pack && bundle install --path vendor/bundle'"
        sh "cat ~/.ssh/gem-private_key.pem | vagrant ssh -c 'cat > ~/.ssh/gem-private_key.pem'"
        sh "vagrant ssh -c 'cd ~/image_compressor_pack && bundle exec rake binary'"
        sh "vagrant ssh -c 'shred -vzu ~/.ssh/gem-private_key.pem'"
        sh "vagrant ssh -c 'gshred -vzu ~/.ssh/gem-private_key.pem'"
        sh "vagrant ssh -c 'cp ~/image_compressor_pack/pkg/*.gem /vagrant'"
        sh "vagrant destroy"
      end
    end
  end
end

task build: [:clean, :download]

task default: [:compile, :spec]
