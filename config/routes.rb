Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :accommodation_types
  resources :places
  resources :regions
  resources :countries
end
