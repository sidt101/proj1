Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons
  patch "pokemon/capture:id", to: "pokemons#capture", as: "capture"
  patch "pokemon/damage:id", to: "pokemons#damage", as: "damage"
end
