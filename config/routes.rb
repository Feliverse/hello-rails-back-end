Rails.application.routes.draw do
  
  # /api/v1/grettings
  namespace :api do
    namespace :v1 do
      resources :grettings
    end
  end
  
end
