Rails.application.routes.draw do
  
  # /api/v1/greetings
  namespace :api do
    namespace :v1 do
      resources :greetings
    end
  end
  
end
