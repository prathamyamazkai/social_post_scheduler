# config/routes.rb
Rails.application.routes.draw do
  root 'home#index' # Adjust to your home or landing page

  # OmniAuth routes for LinkedIn
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

  # Other routes
  # resources :posts, users, etc.
end


