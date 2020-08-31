Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :projects, only: %i[index show create edit update] do
    resources :tasks, only: %i[create]
  end
  resources :tasks, only: %i[edit update destroy]
end
