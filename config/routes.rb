Rails.application.routes.draw do
  resources :submissions
  resources :challenges
  resources :users
  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
