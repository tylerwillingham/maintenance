Rails.application.routes.draw do
  root to: "vehicles#index"

  resources :vehicles, except: [:show]
end
