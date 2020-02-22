require 'selenium-webdriver'

module PowerClient
  class ChromeClient < BaseClient
    def driver
      chrome_path = ENV.fetch('GOOGLE_CHROME_BIN_PATH', nil)
      return :chrome unless chrome_path

      chrome_opts = {
        "chromeOptions" => {
          "binary" => chrome_path
        },
        'goog:loggingPrefs' => { browser: 'ALL' }
      }

      opts = {
        desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(chrome_opts),
        options: Selenium::WebDriver::Chrome::Options.new(args: build_args)
      }

      Selenium::WebDriver.for(:chrome, opts)
    end

    def handle_client_exception(error)
      chrome_error = ChromeClientError.new
      chrome_error.error = error
      chrome_error.screenshot_file = get_screenshot_file
      raise chrome_error
    end

    def get_screenshot_file
      selenium_browser.manage.window.resize_to(1500, 3000)
      image = selenium_browser.screenshot_as(:png)
      tempfile = Tempfile.new(["#{DateTime.now.to_i}-screenshot", ".png"])
      tempfile.binmode
      tempfile.write(image)
      tempfile
    end

    private

    def build_args
      %W[#{headless_arg} disable-gpu no-sandbox browsertime.xvfb].reject(&:blank?)
    end

    def headless_arg
      ENV.fetch('headless_webdriver?') ? 'headless' : nil
    end
  end
end
