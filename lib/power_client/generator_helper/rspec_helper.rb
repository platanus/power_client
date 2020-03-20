module PowerClient::GeneratorHelper::RSpecHelper
  extend ActiveSupport::Concern

  included do
    attr_reader :add_specs
  end

  def add_specs=(value)
    @add_specs = value
  end
end
