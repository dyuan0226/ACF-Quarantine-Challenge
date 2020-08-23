Rails.application.routes.draw do

  # Authentication routes
  resources :sessions
  # resources :users
  get 'users/new', to: 'users#new', as: :signup
  get 'user/edit', to: 'users#edit', as: :edit_current_user
  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy



  resources :submissions
  resources :challenges
  resources :users
  resources :teams

  get 'leaderboards/teams', to: 'teams#leaderboard', as: :leaderboard

  root 'home#index'
end
