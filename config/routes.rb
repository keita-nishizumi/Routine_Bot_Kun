Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "routine_users#index"
  resources :routines, only:[:index, :new, :create] do
    resources :routine_users, only:[:index, :new, :create]
  end
end
