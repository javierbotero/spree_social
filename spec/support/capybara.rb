require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'
require "selenium-webdriver"

Selenium::WebDriver::Chrome::Service.driver_path = ENV.fetch('CHROME_DRIVER_PATH', nil) if ENV['CHROME_DRIVER_PATH']

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :requests

  Capybara.register_driver :selenium_chrome_headless do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu no-sandbox disable-dev-shm-usage window-size=1920,1080])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = :selenium_chrome_headless
  Capybara.default_max_wait_time = 10

  Capybara.save_and_open_page_path = ENV['CIRCLE_ARTIFACTS'] if ENV['CIRCLE_ARTIFACTS']
end
