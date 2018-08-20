require "selenium-webdriver"
require "rspec"
require "io/console"

RSpec.configure do |config|
	config.around(:example) do |example|
		username = 'asad360logica'
		authkey = '4b140c78-2f70-4e2b-a733-e556e02ecde9'

		caps = Selenium::WebDriver::Remote::Capabilities.new

		caps["name"] = "Lambda todo sample"
		caps["build"] = "1.0"
		caps["browserName"] = "Chrome" 		# by default this pulls the latest version
		caps["platform"] = "Windows 10" 	# To specify version, add caps["version"] = "desired version"
		caps["screen_resolution"] = "1024x768"
		caps["record_video"] = "true"
		caps["record_network"] = "true"

		

		@driver = Selenium::WebDriver.for(:remote,
			:url => "http://#{username}:#{authkey}@ondemand.saucelabs.com:443/wd/hub",
			:desired_capabilities => caps)
		session_id = @driver.session_id

		begin
			example.run
		ensure
			@driver.quit
		end
	end
end
