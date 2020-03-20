module PowerClient::GeneratorHelper::ParserHelper
  extend ActiveSupport::Concern

  included do
    attr_reader :add_parser
  end

  def add_parser=(value)
    @add_parser = value
  end

  def parser_path
    "app/parsers/#{snake_case_name}_parser.rb"
  end

  def parser_spec_path
    "spec/parsers/#{snake_case_name}_parser_spec.rb"
  end

  def parser_tpl
    <<~PARSER
      class #{camel_case_name}Parser
        PARSERS_MATCHERS = {
          # complete with the necessary regex matchers
        }

        def parse_data(data)
          # parser logic goes in here
        end
      end
    PARSER
  end

  def parser_spec_tpl
    <<~PARSER
      require 'rails_helper'

      RSpec.describe #{camel_case_name}Parser, type: :parser do
        let(:raw_data) { nil }

        describe "#parse_data" do
          let(:parsed_data) { described_class.new.parse_data(raw_data) }

          pending "describe what perform does here"
        end
      end
    PARSER
  end
end
