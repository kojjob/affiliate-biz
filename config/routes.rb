Rails.application.routes.draw do
  devise_for :users
  get "home/index"
  root "home#index"

  resources :products, only: [ :index, :show ]
  resources :articles, only: [ :index, :show ]
  resources :categories, only: [ :index, :show ]

  namespace :admin do
    get "articles/index"
    get "articles/new"
    get "articles/create"
    get "articles/edit"
    get "articles/update"
    get "articles/destroy"
    get "products/index"
    get "products/new"
    get "products/create"
    get "products/edit"
    get "products/update"
    get "products/destroy"
    get "dashboard/index"
    resources :products
    resources :articles
    resources :categories
  end

  # Affiliate link tracking
  get "/go/:id", to: "affiliate_links#redirect", as: :affiliate_redirect


  # PWA manifest
  # get '/manifest.json', to: 'pwa#manifest', as: :pwa_manifest
end
