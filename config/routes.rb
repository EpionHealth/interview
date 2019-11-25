Rails.application.routes.draw do
  post   '/phq_screener/new',   to: 'phq_screener#create'
  resources :check_ins, only: [:new, :create, :show, :update]
  resources :phq_screener, only: [:new]
  root to: "check_ins#new"
end
