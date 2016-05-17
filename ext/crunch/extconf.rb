require 'mkmf'
require_relative '../../lib/crunch/recipes'

root = File.expand_path("../../../", __FILE__)

recipes = Crunch.recipes

recipes.each do |recipe|
  checkpoint = "#{recipe.target}/#{recipe.name}-#{recipe.version}-#{recipe.host}.installed"
  unless File.exist?(checkpoint)
    `rm -rf tmp/#{recipe.host}/ports/#{recipe.name}/#{recipe.version}`
    recipe.cook
    FileUtils.touch checkpoint
  end
  recipe.activate
end

paths = Dir.glob(File.join(root, 'ports', recipes.first.host, '**', 'bin'))

File.open(File.join(root, 'lib', '.paths.yml'), 'w') do |f|
  f.puts paths.to_yaml
end

create_makefile('crunch/crunch')
exit
