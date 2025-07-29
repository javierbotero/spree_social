require 'bundler'
require 'logger'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/common_rake'

RSpec::Core::RakeTask.new

task default: :spec

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_social'
  Rake::Task['common:test_app'].invoke('Spree::User')

  # Inject require 'logger' into the dummy app's application.rb
  application_path = File.join(File.dirname(__FILE__), 'spec/dummy/config/application.rb')
  content = File.read(application_path)
  content.gsub!("require File.expand_path('../boot', __FILE__)", "require File.expand_path('../boot', __FILE__)\nrequire 'logger'")
  File.write(application_path, content)
end
