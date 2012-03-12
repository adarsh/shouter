Shouter::Application.routes.draw do
  root to: "welcome#index"
  resource :dashboard
end
