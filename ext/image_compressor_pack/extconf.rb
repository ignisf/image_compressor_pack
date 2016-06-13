require 'fileutils'
require_relative '../../lib/image_compressor_pack/recipes'

if Gem::Platform.local.os =~ /freebsd/
  unless system 'which gmake 2>&1 > /dev/null'
    fail "image_compressor_pack requires gmake to be installed"
  end

  `ln -fs #{`which gmake`.chomp} make`
  ENV['PATH'] = "#{File.expand_path '.'}:#{ENV['PATH']}"
end

root = File.expand_path("../../../", __FILE__)

recipes = ImageCompressorPack.recipes

recipes.each do |recipe|
  checkpoint = "#{recipe.target}/#{recipe.name}-#{recipe.version}-#{recipe.host}.installed"
  unless File.exist?(checkpoint)
    `rm -rf tmp/#{recipe.host}/ports/#{recipe.name}/#{recipe.version}`
    recipe.cook
    FileUtils.touch checkpoint
  end
  recipe.activate
end

absolute_paths = Dir.glob(File.join(root, 'ports', recipes.first.host, '**', 'bin'))
relative_paths = absolute_paths.map { |path| path.gsub(/#{root}\//, '') }

File.open(File.join(root, 'lib', '.paths.yml'), 'w') do |f|
  f.puts relative_paths.to_yaml
end

source_makefile = File.join(root, 'Makefile')
destination_makefile = 'Makefile'

unless File.exist?(destination_makefile) and File.identical?(source_makefile, destination_makefile)
  FileUtils.cp(File.join(root, 'Makefile'), 'Makefile')
end
