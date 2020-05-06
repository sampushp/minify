Rails.application.routes.draw do
  root to: 'urls#new'
  resources :urls, only: [:new, :create]
end
