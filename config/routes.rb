Rails.application.routes.draw do
  root 'welcome#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  resources :articles do
    resources :comments
  end

end
