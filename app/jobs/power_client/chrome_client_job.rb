module PowerClient
  class ChromeClientJob < PowerClient::BaseClientJob
    rescue_from(ChromeClientError) do |exception|
      log = ActiveJobLog::Job.find_or_create_job(job_id)
      log.create_client_job(screenshot_file: File.open(exception.screenshot_file))
      fail_job(exception.error)
    end
  end
end
