module PowerClient::GeneratorHelper::JobHelper
  extend ActiveSupport::Concern

  included do
    attr_reader :add_job
  end

  def add_job=(value)
    @add_job = value
  end

  def job_path
    "app/jobs/clients/#{snake_case_name}_job.rb"
  end

  def job_spec_path
    "spec/jobs/clients/#{snake_case_name}_job_spec.rb"
  end

  def job_tpl
    <<~JOB
      class Clients::#{camel_case_name}Job < PowerClient::ChromeClientJob
        def perform
          raw_data = client.perform
          formatted_data = parser.parse_data(raw_data)
        end

        private

        def client
          @client ||= #{camel_case_name}Client.new
        end

        def parser
          @parser ||= #{camel_case_name}Parser.new
        end
      end
    JOB
  end

  def job_spec_tpl
    <<~JOB
      require 'rails_helper'

      describe Clients::#{camel_case_name}Job do
        def perform(*_args)
          described_class.for(*_args)
        end

        pending "describe what perform does here"
      end
    JOB
  end
end
