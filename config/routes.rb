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
end
