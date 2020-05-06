Rails.application.routes.draw do
  default_url_options host: 'localhost:3000'

  root to: 'urls#new'
  get '/m/:checksum', to: 'urls#show', as: :mini
  get '/stats', to: 'urls#index', as: :stats
  resources :urls, only: [:new, :create]
end
