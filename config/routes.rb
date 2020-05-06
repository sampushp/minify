Rails.application.routes.draw do
  default_url_options host: 'localhost:3000'

  root to: 'urls#new'
  get '/:checksum', to: 'urls#show', as: :mini
  resources :urls, only: [:new, :create]
end
