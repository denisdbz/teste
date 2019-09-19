# frozen_string_literal: true

require 'report_builder'
require 'date'

Before do |_scenario|
  window = Capybara.current_session.current_window
  window.resize_to(1366, 768)

  @page = PageObject.new
end

After do |scenario|
  if ENV['screenshot']
    screenshot = page.save_screenshot("log/screenshots/#{scenario.__id__}")
    embed(screenshot, 'image/png', 'Screenshot')
  end
end

at_exit do
  @infos = {
    'Browser' => Capybara.default_driver.to_s.capitalize,
    'Environment' => ENV['ENV_PREFIX'],
    'Data do Teste' => Time.now.to_s
  }
  ReportBuilder.configure do |config|
    config.input_path = 'log/report.json'
    config.report_path = 'log/report'
    config.report_types = [:html]
    config.report_title = 'B2C'
    config.additional_info = @infos
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end




