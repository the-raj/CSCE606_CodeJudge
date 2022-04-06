
Rails.application.routes.draw do
  get 'errors/not_found'
  
  get 'errors/internal_server_error'
  
  resources :users
  resources :problems
  root 'welcome#index'
  post 'log_in', to: 'welcome#log_in'
  # get 'sign_up', to: 'registrations#new'
  # post 'sign_up', to: 'registrations#create'
  # get 'sign_in', to: 'sessions#new'
  # post 'sign_in', to: 'sessions#create', as: 'log_in'
  # delete 'logout', to: 'sessions#destroy'
  # get 'password', to: 'passwords#edit', as: 'edit_password'
  # patch 'password', to: 'passwords#update'
  # get 'password/reset', to: 'password_resets#new'
  # post 'password/reset', to: 'password_resets#create'
  # get 'password/reset/edit', to: 'password_resets#edit'
  # patch 'password/reset/edit', to: 'password_resets#update'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
