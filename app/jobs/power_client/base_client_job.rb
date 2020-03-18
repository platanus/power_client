module PowerClient
  class BaseClientJob < PowerClient::ApplicationJob
    queue_as :client
  end
end
