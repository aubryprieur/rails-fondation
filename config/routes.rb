Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  get '/favorites', to: 'favorite_projects#index', as: 'favorites'
  resources :favorite_projects, only: [:create, :destroy]
  resources :projects
  resources :publications
  devise_for :users
  root to: 'pages#home'
  get 'tags/:tag', to: 'projects#index', as: "tag"
end
