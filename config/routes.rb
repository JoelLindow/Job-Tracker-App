Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :jobs, only: [:create] do
    resources :comments, only: [:create, :update]
  end

  get "/jobs", to: "analysis#index"

  resources :categories

  resources :contacts, only: [:create]

  resources :dashboard, only: [:index]
end
