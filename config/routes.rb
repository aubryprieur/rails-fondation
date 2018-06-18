Rails.application.routes.draw do
  get 'publications/index'

  get 'publications/new'

  get 'publications/create'

  get 'publications/edit'

  get 'publications/update'

  get 'publications/destroy'

  ActiveAdmin.routes(self)
  get '/favorites', to: 'favorite_projects#index', as: 'favorites'
  resources :favorite_projects, only: [:create, :destroy]
  resources :projects
  devise_for :users
  root to: 'pages#home'
  get 'tags/:tag', to: 'projects#index', as: "tag"
end
