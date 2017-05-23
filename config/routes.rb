Rails.application.routes.draw do

  root "site#index"

  resources :owners
  resources :pets, only: [:index, :new, :create]
end
