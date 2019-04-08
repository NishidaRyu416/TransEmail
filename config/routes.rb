Rails.application.routes.draw do
  resources :emails do
    get "send_email"
  end
end
