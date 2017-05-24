Rails.application.routes.draw do

  get 'appointment/new'

  root "site#index"

  resources :owners do
  resources :pets, only: [:index, :new, :create]
  end
  resources :pets, only: [:show, :edit, :update, :destroy] do
  resources :appointments, only: [:new, :create]
  end
end
