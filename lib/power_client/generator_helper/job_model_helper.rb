module PowerClient::GeneratorHelper::JobModelHelper
  extend ActiveSupport::Concern

  def job_model_path
    'app/models/client_job.rb'
  end

  def job_model_tpl
    <<~MODEL
      class ClientJob < ApplicationRecord
        include ImageUploader::Attachment(:screenshot_file)

        belongs_to :active_job_log_job, class_name: 'ActiveJobLog::Job'
      end
    MODEL
  end
end
