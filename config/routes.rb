Rails.application.routes.draw do
  root 'home#index'
  
  resources :products, only: [:index, :show]
  resources :articles, only: [:index, :show]
  
  namespace :admin do
    resources :products
    resources :articles
  end
  
  # Affiliate link tracking
  get '/go/:id', to: 'affiliate_links#redirect', as: :affiliate_redirect
end
