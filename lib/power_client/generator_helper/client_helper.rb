module PowerClient::GeneratorHelper::ClientHelper
  extend ActiveSupport::Concern

  def client_path
    "app/clients/#{snake_case_name}_client.rb"
  end

  def client_spec_path
    "spec/clients/#{snake_case_name}_client_spec.rb"
  end

  def client_tpl
    <<~CLIENT
      class #{camel_case_name}Client < PowerClient::ChromeClient
        URL = 'www.platan.us'

        def crawl
          # crawler logic goes in here
        end
      end
    CLIENT
  end
end
