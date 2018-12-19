Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resource :account, only: [:show, :edit, :update]

  namespace :admin do
    resources :users
  end

  # ---------------------------------
  # 仮のルートページ
  # ---------------------------------
  root 'sessions#new'
end
