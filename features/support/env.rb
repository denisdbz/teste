# frozen_string_literal: true

require 'byebug'
require 'capybara'
require 'capybara/cucumber'
require 'pry'
require 'report_builder'
require 'rspec'
require 'selenium-webdriver'
require_relative 'helpers.rb'

include Helpers

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV['ENV_TYPE']}.yml"))

@browser = ENV['BROWSER']

Capybara.configure do |config|
  case @browser
  when 'chrome'
    @driver = :selenium_chrome
  when 'chrome_headless'
    @driver = :selenium_chrome_headless
  when 'firefox'
    @driver = :selenium
  when 'firefox_headless'
    @drive = :selenium_headless
  end

  config.default_driver = @driver
  config.app_host = CONFIG['url']
  config.default_max_wait_time = 30
end
