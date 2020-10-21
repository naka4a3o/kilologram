Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: :index
  devise_for :users
  resources :users, only: :show do
    resources :calendars
  end
end
