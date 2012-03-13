Shouter::Application.routes.draw do
  root to: "welcome#index"
  resource :dashboard, only: [:show]
  resources :users, only: [:show] do
    # nesting this gives /users/:user_id/following_relationships
    resources :following_relationships, only: [:create]
  end
  resources :shouts, only: [:show]
  resources :text_shouts, only: [:create]
  resources :photo_shouts, only: [:create]
end
