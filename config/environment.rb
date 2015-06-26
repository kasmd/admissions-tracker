# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :domain => 'kasmd.com',
  :authentication => :plain, 
  :user_name => 'samuelhuxiali',
  :password => '19880727hu',
  :enable_starttls_auto => true
}
