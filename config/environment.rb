# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem 'mislav-will_paginate', :version => '>=2.3.8', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'RedCloth', :version => '>=4.1.9'
  config.gem 'populator', :version => '>=0.2.5'
  config.gem 'faker', :version => '>=0.3.1'
  config.gem 'twitter'

  # Skip frameworks you're not going to use.
  config.frameworks -= [ :active_resource ]

  # Activate observers that should always be running
  config.active_record.observers = :user_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  config.time_zone = 'UTC'
end

# ActionMailer Config Settings
ActionMailer::Base.raise_delivery_errors = false
ActionMailer::Base.smtp_settings = MAIL_SETTINGS



# override terrible form error styles
ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| "<span class=\"fieldWithErrors\">#{html_tag}</span>" }

DOMAIN_NAME = 'thisiswhatyouredoingwrong.com'