Rails.application.routes.draw do
  
  get 'customers', to: 'customers#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :account, only: [:show, :edit, :update]

  resources :casefiles do
    post :import, on: :collection
  end
  resources :projects	
  resources :rehouses	

  resources :estates, only: :index	
  resources :lands
  
  resources :gifts
  resources :addresses
  resources :tels
  resources :mails
  resources :customer_agents
  resources :branch_staffs
  resources :identifies
  resources :branches do
    resources :branch_staffs
  end

  resources :controls do
    resources :addresses do
      get :addaddr, on: :collection
    end
    resource :tels do
      get :addcontrol, on: :collection
    end
    resources :mails do
      get :addcontrol, on: :collection
    end
    post :import, on: :collection
  end

  resources :people do
    resources :addresses
    resources :tels
    resources :mails
    resources :identifies
    post :import, on: :collection
  end

  resources :companies do
    resources :addresses
    resources :identifies
    resources :branches
    resources :tels
    resources :mails
    post :import, on: :collection
  end

  resources :agents do
    resources :addresses
  end

  resources :customers do
    resources :addresses
    resources :tels
    resources :mails
    resources :identifies
    resources :gifts
    resources :customer_agents
  end



  namespace :admin do
    resources :users
  end

  # ---------------------------------
  # 仮のルートページ
  # ---------------------------------
  root 'customers#index'
end
