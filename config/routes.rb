Rails.application.routes.draw do
  get '/dashboard' => 'dashboard#index'

  get '/jobs' => 'jobs#query', as: :query

  get '/' => 'jobs#home', as: :home

  resources :categories do
    resources :jobs, only: [:show]
  end

  resources :companies do
    resources :contacts, only: [:create, :new]
  end

  resources :companies do
    resources :jobs do
      resources :comments, only: [ :new, :create]
    end
  end

end
