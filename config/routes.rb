Rails.application.routes.draw do
  get 'users/index'
  get 'reimbursements/index'
  resources :users
  resources :reimbursements
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'sessions#create'
  post '/auth/register', to: 'users#create'
  # Defines the root path route ("/")
  # root "articles#index"
end
