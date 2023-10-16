Rails.application.routes.draw do
  resources :users
  resources :categories, only: [:index, :new, :create] do
    resources :transaction_details, only: [:index, :new, :create]
  end
  root to: "categories#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'transaction_details/new', to: 'transaction_details#new', as: 'new_transaction_detail'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
