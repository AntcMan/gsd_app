Rails.application.routes.draw do
  root 'todos#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :todos
  # Defines the root path route ("/")
  # root "articles#index"
end
