RSpec.describe PowerClient::GeneratorHelper::ParserHelper, type: :generator do
  describe "#parser_path" do
    let(:expected_path) { "app/parsers/login_parser.rb" }

    def perform
      generators_helper.parser_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#parser_spec_path" do
    let(:expected_path) { "spec/parsers/login_parser_spec.rb" }

    def perform
      generators_helper.parser_spec_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#parser_tpl" do
    let(:template) do
      <<~PARSER
        class LoginParser
          PARSERS_MATCHERS = {
            # complete with the necessary regex matchers
          }

          def parse_data(data)
            # parser logic goes in here
          end
        end
      PARSER
    end

    def perform
      generators_helper.parser_tpl
    end

    it { expect(perform).to eq(template) }
  end

  describe "#parser_spec_tpl" do
    let(:template) do
      <<~PARSER
        require 'rails_helper'

        RSpec.describe LoginParser, type: :parser do
          let(:raw_data) { nil }

          describe "#parse_data" do
            let(:parsed_data) { described_class.new.parse_data(raw_data) }

            pending "describe what perform does here"
          end
        end
      PARSER
    end

    def perform
      generators_helper.parser_spec_tpl
    end

    it { expect(perform).to eq(template) }
  end
end
