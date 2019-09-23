Rails.application.routes.draw do
  resources :check_ins, only: [:new, :create, :show, :update] do
    member { get :phq_screener }
  end

  root to: "check_ins#new"
end
