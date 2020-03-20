module PowerClient
  class ChromeClientError < StandardError
    attr_accessor :error, :screenshot_file
  end
end
