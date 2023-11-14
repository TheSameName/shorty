Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get  "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  if Rails.env.local?
    get  "sign_up", to: "registrations#new"
    post "sign_up", to: "registrations#create"

    resources :sessions, only: %i[index show destroy]
    resource  :password, only: %i[edit update]

    namespace :identity do
      resource :email,              only: %i[edit update]
      resource :email_verification, only: %i[show create]
      resource :password_reset,     only: %i[new edit create update]
    end

    resources :links

    get "/home" => "home#index"
  end

  get "/statistics" => "statistics#index"

  root "links#new"

  get "/:slug" => "redirects#show", as: :short
end
