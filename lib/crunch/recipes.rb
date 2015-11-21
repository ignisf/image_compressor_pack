require 'mini_portile'
require 'yaml'

module Crunch
  def self.recipes
    recipes = YAML.load_file(File.expand_path('../recipes.yml', __FILE__))

    recipes.map do |name, parameters|
      MiniPortile.new(name, parameters['version']).tap do |recipe|
        recipe.files = parameters['files']
        recipe.target = if parameters['target'].nil?
                          File.expand_path('../../../ports', __FILE__)
                        else
                          parameters['target']
                        end
        recipe.configure_options = parameters['configure_options'] unless parameters['configure_options'].nil?
      end
    end
  end
end
