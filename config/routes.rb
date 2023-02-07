Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: '/graphql', graphql_path: '/graphql' if Rails.env.development?
  post '/graphql', to: 'graphql#execute'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
