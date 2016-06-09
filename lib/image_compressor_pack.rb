require 'image_compressor_pack/recipes'
require 'image_compressor_pack/version'

module ImageCompressorPack
  def self.paths
    root = File.expand_path("../../", __FILE__)
    relative_paths = YAML.load_file File.expand_path('../.paths.yml', __FILE__)
    relative_paths.map { |path| File.join root, path }
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

ImageCompressorPack.activate
