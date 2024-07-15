Rails.application.routes.draw do
  resources :check_ins, only: [:new, :create, :show, :update]
  resources :patient_screenings, only: [:new]

  root to: "check_ins#new"
end
