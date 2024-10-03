require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require_relative 'page_helper'

World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)

HEADLESS = ENV['HEADLESS']
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT_TYPE}.yml")

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  options.add_argument('--disable-infobars')
  options.add_argument('--no-sandbox')
  options.add_argument('--remote-debugging-port=9222')
  options.add_argument('window-size=1366x768')

  if HEADLESS
    options.add_argument('headless')
    options.add_argument('disable-gpu')
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 30
  config.app_host = 'https://smartspace.com.br'
end
