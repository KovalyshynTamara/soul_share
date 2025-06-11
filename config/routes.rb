Rails.application.routes.draw do
  devise_for :users

  resources :events do
    resource :event_participant, only: [ :create, :destroy ]
    resources :event_songs, only: [ :create, :destroy ]
    resources :comments, only: [ :create ]
  end

  resources :songs do
    resources :ratings, only: [ :create ], shallow: true
  end

  namespace :admin do
    resources :users do
      member do
        get "impersonate"
      end
    end
    resources :events
  end

get "stop_impersonating", to: "admin/users#stop_impersonating", as: :stop_impersonating
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500. змінити пароль через фор
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"
end
