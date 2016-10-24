ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def setup
    # Turn on test mode - auth requests will be short-circuited
    OmniAuth.config.test_mode = true
    # What data should we get back from auth requests?
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github', uid: '99999', info: { email: "a@b.com", name: "Ada" }
      })
  end
end
