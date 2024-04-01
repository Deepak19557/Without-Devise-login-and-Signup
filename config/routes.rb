Rails.application.routes.draw do
  get 'welcome/index'
  resources :registrations
  resources :sessions
  root 'welcome#index'
  get 'session_destroy', to: 'sessions#session_destroy'

end
