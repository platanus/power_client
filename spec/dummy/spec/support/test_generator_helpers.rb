module TestGeneratorHelpers
  extend ActiveSupport::Concern

  included do
    subject(:generators_helper) { PowerClient::GeneratorHelpers.new(init_params) }

    let(:client_name) { 'Login' }
    let(:add_specs) { true }
    let(:add_parser) { true }
    let(:add_job) { true }

    let(:init_params) do
      {
        client_name: client_name,
        add_specs: add_specs,
        add_parser: add_parser,
        add_job: add_job,
      }
    end
  end
end
