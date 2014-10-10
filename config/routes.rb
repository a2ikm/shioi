Rails.application.routes.draw do
  root 'root#index'

  resources :feeds
end
