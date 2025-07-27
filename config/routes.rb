Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Root path
  root "dashboard#index"
  
  # Dashboard
  get "dashboard", to: "dashboard#index"
  
  # Core resources
  resources :studies do
    resources :patients do
      resources :visits
      resources :adverse_events
      resources :deviations
    end
    resources :queries
  end
  
  resources :queries do
    member do
      patch :assign
      patch :respond
      patch :close
      patch :cancel
    end
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :documents

  # API namespace for future integrations
  namespace :api do
    namespace :v1 do
      resources :queries, only: [:index, :show, :create, :update]
      resources :studies, only: [:index, :show]
      resources :patients, only: [:index, :show]
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
