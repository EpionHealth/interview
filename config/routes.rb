Rails.application.routes.draw do
  resources :check_ins, only: [:new, :create, :show, :update]
  resources :phq_screeners, only: [:new, :create]

  root to: "check_ins#new"
end
