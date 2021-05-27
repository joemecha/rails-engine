Rails.application.routes.draw do
  # get 'api/v1/merchants', to: 'merchants#index'
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        resources :find, controller: :search, only: :index
      end

      namespace :items do
        resources :find_all, controller: :search, only: :index
      end

      resources :merchants, only: %i[index show] do
        # resources :find, controller: :search, only: :index 
        resources :items, controller: :merchant_items, only: :index
      end

      resources :items do 
        resources :find_all, controller: :items_search, only: :index
        resources :merchant, controller: :items_merchant, only: :index
      end
    end
  end
end
