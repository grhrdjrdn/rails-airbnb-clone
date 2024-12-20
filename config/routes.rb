Rails.application.routes.draw do
  devise_for :users
  root to: "flats#index"
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index] do
    patch :approve
    patch :deny
  end
end
