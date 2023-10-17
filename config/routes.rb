Rails.application.routes.draw do
  devise_for :users, path: 'users',
                     path_names: { sign_in: 'sign_in', sign_out: 'sign_out', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    # root to: 'categories#index'
  end
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root "splash#index", as: :unauthenticated_root
  end
  
  resources :users
  resources :categories, only: [:index, :new, :create] do
    resources :transaction_details, only: [:index, :new, :create]
  end
end
