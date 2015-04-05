Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch "pokemon/capture:id", to: "pokemon#capture", as: "capture"
  patch "pokemon/damage:id", to: "pokemon#damage", as: "damage"
  get "pokemon/new", to: "pokemon#new"
end
