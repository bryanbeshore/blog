Rails.application.routes.draw do
  root "pages#home"

  get "about", to: "pages#about"
  get "writings", to: "posts#index"

  resources :posts, only: [:index, :show], param: :slug

  get "feed", to: "posts#feed", defaults: { format: :xml }
end
