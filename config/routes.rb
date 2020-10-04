Rails.application.routes.draw do
  # get 'checklists/create'
  # get 'checklists/update'
  # get 'checklists/destroy'
  # get 'checklists/check'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "routine_users#index"
  resources :routines do
    resources :routine_users, only:[:index, :new, :create, :edit, :update]
    collection do
      get 'search'
    end
    resources :check_list, only:[:create, :destroy] do
      resources :check_items, only:[:create, :destroy]
    end
  end

  patch "/routines/:routine_id/check_list/:check_list_id/check_items", to: "check_items#create"
  patch "/routines/:routine_id/check_list", to: "check_lists#create"

  # resources :check_items, only:[:create, :destroy]
end
