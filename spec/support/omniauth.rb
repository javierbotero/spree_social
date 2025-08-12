RSpec.configure do |config|
  config.before(:each, type: :feature) do
    OmniAuth.config.test_mode = true

    # ✅ Prevent OmniAuth::AuthenticityError during feature tests
    OmniAuth.config.request_validation_phase = proc {}
    OmniAuth.config.before_request_phase = proc {}
  end

  config.after(:each, type: :feature) do
    OmniAuth.config.mock_auth[:twitter] = nil
    OmniAuth.config.request_validation_phase = nil
    OmniAuth.config.before_request_phase = nil
  end
end
