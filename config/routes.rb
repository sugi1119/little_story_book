Rails.application.routes.draw do
  devise_for :authors
  resources :dashboard

   root to: "home#index"
end
