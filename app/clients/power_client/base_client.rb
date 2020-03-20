module PowerClient
  class BaseClient
    def browser
      @browser ||= Pincers.for_webdriver(driver, wait_timeout: ENV.fetch('CLIENT_TIMEOUT', 35).to_i)
    end

    def driver
      raise NotImplementedError
    end

    def selenium_browser
      browser.document
    end

    def ensuring_browser_closure(&block)
      block.call
    rescue StandardError => e
      handle_client_exception(e)
    ensure
      browser&.close
      @browser = nil
    end

    def handle_client_exception(error)
      raise error
    end

    def long_sleep
      sleep 1
    end

    def short_sleep
      sleep 0.2
    end
  end
end
