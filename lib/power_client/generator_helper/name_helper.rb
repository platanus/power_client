module PowerClient::GeneratorHelper::NameHelper
  extend ActiveSupport::Concern

  included do
    attr_reader :client_name
  end

  def client_name=(value)
    @client_name = value
  end

  def snake_case_name
    client_name.underscore
  end

  def camel_case_name
    client_name.camelize
  end
end
