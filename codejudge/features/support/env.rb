require 'selenium/webdriver'

# capabilities = Selenium::WebDriver::Remote::Capabilities.new

# capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
# capabilities['name'] = 'My first Test'
# capabilities['browserName'] = ENV['SELENIUM_BROWSER'] || 'chrome'
# capabilities['version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']

browser = Selenium::Driver.new(browser: :remote, url: ENV['HUB_URL'])

Before do |scenario|
	@browser = browser
end

at_exit do
	browser.quit
end