Rails.application.routes.draw do
  root 'shifts#index'

  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shifts
  resources :businesses
  resources :employees
end
