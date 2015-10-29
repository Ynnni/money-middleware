Rails.application.routes.draw do
  root to: 'application#index'
  resources :accounts
  resources :expenses

  mount Money::API => '/'
end
