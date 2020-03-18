RSpec.describe PowerClient::GeneratorHelper::JobHelper, type: :generator do
  describe "#job_path" do
    let(:expected_path) { "app/jobs/clients/login_job.rb" }

    def perform
      generators_helper.job_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#job_spec_path" do
    let(:expected_path) { "spec/jobs/clients/login_job_spec.rb" }

    def perform
      generators_helper.job_spec_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#job_tpl" do
    let(:template) do
      <<~JOB
        class Clients::LoginJob < PowerClient::ChromeClientJob
          def perform
            raw_data = client.crawl
            formatted_data = parser.parse_data(raw_data)
            Clients::Login.for(formatted_data: formatted_data)
          end

          private

          def client
            @client ||= LoginClient.new
          end

          def parser
            @parser ||= LoginParser.new
          end
        end
      JOB
    end

    def perform
      generators_helper.job_tpl
    end

    it { expect(perform).to eq(template) }
  end

  describe "#job_spec_tpl" do
    let(:template) do
      <<~JOB
        require 'rails_helper'

        describe Clients::LoginJob do
          def perform(*_args)
            described_class.for(*_args)
          end

          pending "describe what perform does here"
        end
      JOB
    end

    def perform
      generators_helper.job_spec_tpl
    end

    it { expect(perform).to eq(template) }
  end
end
