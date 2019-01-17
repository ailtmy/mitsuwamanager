Rails.application.routes.draw do
  
  get 'customers', to: 'customers#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :account, only: [:show, :edit, :update]

  resources :casefiles
  resources :projects	

  resources :addresses
  resources :customer_agents

  resources :people do
    resources :addresses
  end

  resources :companies do
    resources :addresses
  end

  resources :agents do
    resources :addresses
  end

  resources :customers do
    resources :addresses
  end



  namespace :admin do
    resources :users
  end

  # ---------------------------------
  # 仮のルートページ
  # ---------------------------------
  root 'customers#index'
end
