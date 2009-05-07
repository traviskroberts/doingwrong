# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"

  # Skip frameworks you're not going to use.
  config.frameworks -= [ :active_resource ]

  # Activate observers that should always be running
  config.active_record.observers = :user_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  config.time_zone = 'UTC'
end

DOMAIN_NAME = 'thisiswhatyouredoingwrong.com'