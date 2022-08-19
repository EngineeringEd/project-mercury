Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#index'

  namespace :api, constraint: { format: 'json' } do
    namespace :v1 do
      post 'mercury', to: 'mercury#index'
      post 'mercury/connect-users', to: 'mercury#connect_users'
      post 'mercury/connect-users-whatsapp', to: 'mercury#connect_users_whatsapp'
      get 'conversations/:sid', to: 'conversation#get'
      post 'conversations', to: 'conversation#delete'
      get 'conversations', to: 'conversation#get_all_and_delete'
    end
  end
end
