Rails.application.routes.draw do
  resources :conversions
  resources :clicks
  devise_for :users
  root "home#index"

  resources :products, only: [ :index, :show ]
  resources :articles, only: [ :index, :show ]
  resources :categories, only: [ :index, :show ]

  namespace :admin do
    resources :products
    resources :articles
    resources :categories
  end

  # Affiliate link tracking
  get "/go/:id", to: "affiliate_links#redirect", as: :affiliate_redirect

  # Static Pages
  get "/about", to: "static#about", as: :about

  # PWA manifest
  # get '/manifest.json', to: 'pwa#manifest', as: :pwa_manifest
end
