Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'destinations#index'
  delete '/api/v1/destinations/:id', to: 'api/v1/destinations#destroy'
  namespace :api do
    namespace :v1 do
      get '/destination-weather/:id', to: 'destination_weather#show'
      resources :destinations
    end
  end
  resources :destinations
end
