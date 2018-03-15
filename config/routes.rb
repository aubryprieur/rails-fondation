Rails.application.routes.draw do
  get '/favorites', to: 'favorite_projects#index', as: 'favorites'
  resources :favorite_projects, only: [:create, :destroy]
  resources :projects
  devise_for :users
  root to: 'pages#home'
  get 'tags/:tag', to: 'projects#index', as: "tag"
end
