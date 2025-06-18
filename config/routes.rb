Rails.application.routes.draw do
  # Root page (homepage controller)
  root "homepage#index"

  # Health check (optional)
  get "up" => "rails/health#show", as: :rails_health_check

  # Devise routes for user auth
  devise_for :users

  # Custom user-related pages (e.g. user profiles)
  resources :users, only: [:index, :show]

  # App-specific resources (browsable music stuff)
  resources :albums, only: [:index]
  resources :artists, only: [:index, :show]
  resources :genres, only: [:index]
  resources :playlists, only: [:index]
  resources :tracks, only: [:index] do
    patch :upload_audio, on: :member
  end

  resources :genres, only: [:index]
  resources :devices, only: [:new, :create, :index, :show]
  resources :subscriptions, only: [:new, :create, :index, :show]
end
