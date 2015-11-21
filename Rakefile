require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
require "rake/extensiontask"

task :build => :compile

task :compile do
  sh "ruby ext/crunch/extconf.rb"
end
