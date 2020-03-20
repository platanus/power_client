RSpec.describe PowerClient::GeneratorHelper::ClientHelper, type: :generator do
  describe "#client_path" do
    let(:expected_path) { "app/clients/login_client.rb" }

    def perform
      generators_helper.client_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#client_spec_path" do
    let(:expected_path) { "spec/clients/login_client_spec.rb" }

    def perform
      generators_helper.client_spec_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#client_tpl" do
    let(:template) do
      <<~CLIENT
        class LoginClient < PowerClient::ChromeClient
          URL = 'www.platan.us'

          def perform
            # client logic goes in here
          end
        end
      CLIENT
    end

    def perform
      generators_helper.client_tpl
    end

    it { expect(perform).to eq(template) }
  end
end
