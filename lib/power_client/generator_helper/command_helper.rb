module PowerClient::GeneratorHelper::CommandHelper
  extend ActiveSupport::Concern

  included do
    attr_reader :add_command
  end

  def add_command=(value)
    @add_command = value
  end

  def command_path
    "app/commands/clients/#{snake_case_name}.rb"
  end

  def command_spec_path
    "spec/commands/clients/#{snake_case_name}_spec.rb"
  end

  def command_tpl
    <<~COMMAND
      class Clients::#{camel_case_name} < PowerTypes::Command.new(:formatted_data)
        def perform
          # Command code goes here
        end
      end
    COMMAND
  end

  def command_spec_tpl
    <<~COMMAND
      require 'rails_helper'

      describe Clients::#{camel_case_name} do
        def perform(*_args)
          described_class.for(*_args)
        end

        pending "describe what perform does here"
      end
    COMMAND
  end
end
