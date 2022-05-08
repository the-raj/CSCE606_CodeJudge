
Rails.application.routes.draw do
  resources :languages
  resources :attempts
  resources :problems


  get 'errors/not_found'
  get 'errors/internal_server_error'
  get 'errors/forbidden'
  
  resources :users, only: [:index, :create, :edit, :update, :show, :destroy]
  resources :problems
  root 'welcome#index'
  post 'log_in', to: 'welcome#log_in'
  get 'log_in/create', to: 'welcome#log_in', as: :create_log_in
  delete 'log_out', to: 'welcome#log_out'
  get 'register', to: 'registrations#new'
  post 'register', to: 'registrations#create'
  get 'register/create', to: 'registrations#create', as: :create_register
  post 'color_mode', to: 'application#color_mode', as: :color_mode

  match "/403", to: "errors#forbidden", via: :all
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
