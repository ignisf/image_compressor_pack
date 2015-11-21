require 'mkmf'
require_relative '../../lib/crunch/recipes'

root = File.expand_path("../../../", __FILE__)

recipes = Crunch.recipes
recipes.map(&:cook)

paths = Dir.glob(File.join(root, 'ports', recipes.first.host, '**', 'bin'))

File.open(File.join(root, 'lib', '.paths.yml'), 'w') do |f|
  f.puts paths.to_yaml
end

create_makefile('crunch/crunch')
exit
