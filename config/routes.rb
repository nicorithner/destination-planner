Rails.application.routes.draw do
  root 'destinations#index'
  namespace :api do
    namespace :v1 do
      resources :destinations
      resources :destination_weather
    end
  end
  resources :destinations
end
