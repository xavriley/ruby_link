require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

require 'rake/extensiontask'
spec = Gem::Specification.load('ruby_link.gemspec')
Rake::ExtensionTask.new('ruby_link') do |ext|
  # ext.platform or ext.cross_config_options
  # might work to enable universal builds on darwin for older processors
  # ext.lib_dir = "lib/ruby_link"
end

task :default => :test
