Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :categories, expect: [:new, :edit] do
      resources :transactions, expect: [:new, :edit]
    end
  end
end
