Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, constraint: { format: 'json' } do
    namespace :v1 do
      post 'mercury', to: 'mercury#index'
      post 'mercury/connect-users', to: 'mercury#connect_users'
      get 'conversations/:sid', to: 'conversation#get'
      post 'conversations', to: 'conversation#delete'
      get 'conversations', to: 'conversation#get_all_and_delete'
    end
  end
end
