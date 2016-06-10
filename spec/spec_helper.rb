unless ENV['TEST_INSTALLED_GEM'].to_s.empty?
  $LOAD_PATH.delete_if { |p| File.expand_path(p) == File.expand_path("./lib") }
end

require 'image_compressor_pack'

RSpec.configure do |c|
  c.before do
    stub_const('ImageOptim::Config::GLOBAL_PATH', '/dev/null')
    stub_const('ImageOptim::Config::LOCAL_PATH', '/dev/null')
  end

  c.order = :random
end
