Rails.application.routes.draw do

  resources :projects
  devise_for :users
  root to: 'pages#home'
  get 'tags/:tag', to: 'projects#index', as: "tag"
end
