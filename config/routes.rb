Rails.application.routes.draw do
  root 'root#index'
  get "r/:uid" => "root#show", as: :reader

  resources :feeds
end
