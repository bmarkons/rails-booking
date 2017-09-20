Rails.application.routes.draw do
  resources :comments
  resources :room_reservations
  resources :rooms
  resources :accommodations do
    post "approve", on: :member, as: :approve
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :accommodation_types
  resources :places
  resources :regions
  resources :countries
  get "users", to: "users#index", as: "managers"
  post "toggle_block/:id", to: "users#toggle_block"
end
