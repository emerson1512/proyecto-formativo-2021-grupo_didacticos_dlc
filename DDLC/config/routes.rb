Rails.application.routes.draw do

  resources :line_items
  resources :carts
  devise_for :users
  root to: "home#index"
  get "home/index"
  resources :users
  resources :productos
  resources :tipos
  
  resources :compras
  resources :usuarios
  resources :registrodetrabajadores
  resources :registros
  resources :reclamos
  resources :personas
  resources :compras
  resources :generos
  resources :organizaciones
  resources :stoockdeproductos
  resources :proveedores
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
