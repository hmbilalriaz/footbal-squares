Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  resources :payments, only: [:new, :create] do
    collection do
      get 'success'
      get 'cancel'
    end
  end
end
