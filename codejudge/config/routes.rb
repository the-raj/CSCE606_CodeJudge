
Rails.application.routes.draw do
  resources :problems

  resources :submissions

  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'errors/forbidden'

  resources :users
  resources :problems
  root 'welcome#index'
  post 'log_in', to: 'welcome#log_in'
  delete 'log_out', to: 'welcome#log_out'
  # get 'sign_up', to: 'registrations#new'
  # post 'sign_up', to: 'registrations#create'
  # get 'sign_in', to: 'sessions#new'
  # post 'sign_in', to: 'sessions#create', as: 'log_in'
  # get 'password', to: 'passwords#edit', as: 'edit_password'
  # patch 'password', to: 'passwords#update'
  # get 'password/reset', to: 'password_resets#new'
  # post 'password/reset', to: 'password_resets#create'
  # get 'password/reset/edit', to: 'password_resets#edit'
  # patch 'password/reset/edit', to: 'password_resets#update'

  match "/403", to: "errors#forbidden", via: :all
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
