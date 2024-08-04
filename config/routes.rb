Rails.application.routes.draw do
  resources :check_ins, only: [:show, :new, :create, :update] do
    resources :screeners, only: [:show, :create], module: "check_ins" do
      resource :result, only: [:show], module: "screeners"
    end
  end
  resources :question, only: [] do
    resources :answers, only: [:new, :create], module: "question"
  end

  root to: "check_ins#new"
end
