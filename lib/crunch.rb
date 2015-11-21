require 'crunch/recipes'
require 'crunch/version'

module Crunch
  def self.paths
    YAML.load_file File.expand_path('../.paths.yml', __FILE__)
  end

  def self.activate
    paths.each do |path|
      path.gsub!(File::SEPARATOR, File::ALT_SEPARATOR) if File::ALT_SEPARATOR

      old_value = ENV['PATH'] || ''

      unless old_value.include?(path)
        ENV['PATH'] = "#{path}#{File::PATH_SEPARATOR}#{old_value}"
      end
    end
  end
end

Crunch.activate
