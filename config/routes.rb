Rails.application.routes.draw do
  
  get 'customers', to: 'customers#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :account, only: [:show, :edit, :update]

  resources :casefiles
  resources :projects	
  resources :gifts
  resources :addresses
  resources :customer_agents
  resources :branch_staffs
  resources :identifies
  resources :branches do
    resources :branch_staffs
  end

  resources :people do
    resources :addresses
    resources :identifies
  end

  resources :companies do
    resources :addresses
    resources :identifies
    resources :branches
  end

  resources :agents do
    resources :addresses
  end

  resources :customers do
    resources :addresses
    resources :identifies
    resources :gifts
  end



  namespace :admin do
    resources :users
  end

  # ---------------------------------
  # 仮のルートページ
  # ---------------------------------
  root 'customers#index'
end
