Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'places#index'
  resources :places do
    resources :comments, only: :create
    resources :photos, only: :create
  end

  resources :users, only: :show
end
