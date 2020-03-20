RSpec.describe PowerClient::GeneratorHelper::NameHelper, type: :generator do
  describe "#snake_case_name" do
    let(:expected_name) { "login" }

    def perform
      generators_helper.snake_case_name
    end

    it { expect(perform).to eq(expected_name) }
  end

  describe "#camel_case_name" do
    let(:expected_name) { "Login" }

    def perform
      generators_helper.camel_case_name
    end

    it { expect(perform).to eq(expected_name) }
  end
end
