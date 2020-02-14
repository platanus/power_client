Rails.application.routes.draw do
  mount PowerClient::Engine => "/power_client"
end
