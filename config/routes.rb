Rails.application.routes.draw do
  resources :check_ins, only: [:new, :create, :show, :update] do
    get 'screeners/depression', to: 'check_ins#depression_screener_new', as: 'depression_screener'
  end

  root to: "check_ins#new"
end
