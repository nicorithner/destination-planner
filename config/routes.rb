Rails.application.routes.draw do
  root 'destinations#index'
  namespace :api do
    namespace :v1 do
      resources :destinations
    end
  end
  resources :destinations
end
