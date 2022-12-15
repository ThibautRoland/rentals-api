Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :listings, only: [:index, :show, :create, :update, :destroy]
      resources :missions, only: :index
    end
  end
  namespace :admin do
    resources :listings
  end
end
