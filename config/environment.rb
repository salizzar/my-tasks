# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'sqlite3-ruby',        :version => '1.2.5',  :lib => 'sqlite3'
  config.gem 'rspec',               :version => '1.3.0',  :lib => false
  config.gem 'rspec-rails',         :version => '1.3.2',  :lib => false
  config.gem 'rmagick',             :version => '2.12.2', :lib => 'RMagick2'
  config.gem 'warden',              :version => '0.9.6'
  config.gem 'cucumber',            :version => '0.6.4'

  config.gem 'devise',              :version => '1.0.4'
  config.gem 'inherited_resources', :version => '1.0.4'
  config.gem 'carrierwave',         :version => '0.4.5'
  config.gem 'capybara',            :version => '0.3.5'

  config.time_zone = 'UTC'
end
