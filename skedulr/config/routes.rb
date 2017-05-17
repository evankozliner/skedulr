Rails.application.routes.draw do
  root 'employees#index'

  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :businesses do
    resources :shifts
  end
  resources :employees
end
