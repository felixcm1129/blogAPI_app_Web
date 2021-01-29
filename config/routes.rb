Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end

  namespace :api, constraints: { format: 'json' } do
    resources :articles, excepts: [:edit, :new] do
      resources :comments
    end
  end
end
