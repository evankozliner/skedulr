Rails.application.routes.draw do
  root 'employees#index'

  delete 'destroy_relation/:id', to: 'businesses#destroy_relation', as: :destroy_relation

  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :shifts
  resources :businesses
  resources :employees
  resources :manager_employees

  get 'shifts/by_business/:business_id', to: 'shifts#get_shifts_by_business'
end
