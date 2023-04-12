Rails.application.routes.draw do
  resources :users
  resources :reimbursements

  get 'users/index'
  get 'reimbursements/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post '/auth/login', to: 'sessions#create'
  post '/auth/register', to: 'users#create'

  patch 'reimbursements/id', to: 'reimbursements#update'

  get '/user/:id/reimbursements', to: 'reimbursements#myReimbursements'
  # Defines the root path route ("/")
  # root "articles#index"
end
