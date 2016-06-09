require 'mini_portile2'
require 'yaml'
require 'rbconfig'

module ImageCompressorPack
  def self.recipes
    unless RbConfig::CONFIG['target_os'] =~ /darwin/
      statically_linked_recipes
    else
      dynamically_linked_recipes
    end
  end

  def self.statically_linked_recipes
    parse_recipes File.expand_path('../statically_linked_recipes.yml', __FILE__)
  end

  def self.dynamically_linked_recipes
    parse_recipes File.expand_path('../dynamically_linked_recipes.yml', __FILE__)
  end

  def self.parse_recipes(file)
    recipes = YAML.load_file(file)

    recipes.map do |name, parameters|
      MiniPortile.new(name, parameters['version']).tap do |recipe|
        recipe.files = parameters['files']
        recipe.target = if parameters['target'].nil?
                          File.expand_path('../../../ports', __FILE__)
                        else
                          parameters['target']
                        end
        unless parameters['patch_files'].nil?
          recipe.patch_files = parameters['patch_files'].map do |patch|
            File.expand_path("../../../ports/patches/#{name}/#{patch}", __FILE__)
          end
        end
        recipe.configure_options = parameters['configure_options'] unless parameters['configure_options'].nil?
      end
    end
  end
end
