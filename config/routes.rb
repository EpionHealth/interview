Rails.application.routes.draw do
  resources :check_ins, only: [:new, :create, :show, :update] do
    member do
      get  'depression_screener', to: 'check_ins#depression_screener_new'
      post 'depression_screener', to: 'check_ins#depression_screener_create'
    end
  end

  root to: "check_ins#new"
end
