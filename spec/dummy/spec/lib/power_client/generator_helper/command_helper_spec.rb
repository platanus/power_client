RSpec.describe PowerClient::GeneratorHelper::CommandHelper, type: :generator do
  describe "#command_path" do
    let(:expected_path) { "app/commands/clients/login.rb" }

    def perform
      generators_helper.command_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#command_spec_path" do
    let(:expected_path) { "spec/commands/clients/login_spec.rb" }

    def perform
      generators_helper.command_spec_path
    end

    it { expect(perform).to eq(expected_path) }
  end

  describe "#command_tpl" do
    let(:template) do
      <<~COMMAND
        class Clients::Login < PowerTypes::Command.new(:formatted_data)
          def perform
            # Command code goes here
          end
        end
      COMMAND
    end

    def perform
      generators_helper.command_tpl
    end

    it { expect(perform).to eq(template) }
  end

  describe "#command_spec_tpl" do
    let(:template) do
      <<~COMMAND
        require 'rails_helper'

        describe Clients::Login do
          def perform(*_args)
            described_class.for(*_args)
          end

          pending "describe what perform does here"
        end
      COMMAND
    end

    def perform
      generators_helper.command_spec_tpl
    end

    it { expect(perform).to eq(template) }
  end
end
