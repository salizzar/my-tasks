# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'warden',              :version => '0.9.6'
  config.gem 'sqlite3-ruby',        :version => '1.2.5',  :lib => 'sqlite3'
  config.gem 'rmagick',             :version => '2.12.2', :lib => 'RMagick2'

  config.gem 'devise',              :version => '1.0.4'
  config.gem 'inherited_resources', :version => '1.0.4'
  config.gem 'carrierwave',         :version => '0.4.5'

  config.time_zone = 'UTC'
end
