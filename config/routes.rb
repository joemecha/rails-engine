Rails.application.routes.draw do
  # get 'api/v1/merchants', to: 'merchants#index'
  namespace :api do 
    namespace :v1 do
      resources :merchants, only: :index 
    end
  end
end
