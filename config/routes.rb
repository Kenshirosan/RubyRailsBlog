Rails.application.routes.draw do

    root 'welcome#index'

    resources :articles do
        resources :comments
    end

    resources :users
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # get '/test', to: 'test#index'
end
