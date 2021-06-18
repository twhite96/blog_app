Rails.application.routes.draw do
  root                'posts#index'
  get    'signup'  => 'users#new'
 
  resources :posts
  resources :users
  # users resource is the collection of user urls
  # get "/users", to: "users#index"
  # get "/users/:id/edit", to: "users#edit"
  # post "/users", to: "users#create"
  # http verb "slug-or-url", to: "controller#action"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
