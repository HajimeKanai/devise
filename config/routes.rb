Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  resources :items
  resources :users, only: [:show, :edit, :update]


#   post "user/:id/edit" => "user/edit"
end
