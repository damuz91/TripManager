Rails.application.routes.draw do

    root 'home#index'

    resources :routes
    resources :passengers
    resources :vehicles
    devise_for :users
    
end
