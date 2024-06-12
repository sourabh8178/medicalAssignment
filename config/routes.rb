Rails.application.routes.draw do
  root 'sessions#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :patients

  get 'receptionists/dashboard', to: 'patients#index', as: 'receptionists_dashboard'
  get 'doctors/dashboard', to: 'doctors#dashboard', as: 'doctors_dashboard'
end
