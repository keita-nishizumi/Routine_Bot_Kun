Rails.application.routes.draw do
  get 'checklists/create'
  get 'checklists/update'
  get 'checklists/destroy'
  get 'checklists/check'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "routine_users#index"
  resources :routines do
    resources :routine_users, only:[:index, :new, :create, :edit, :update]
    collection do
      get 'search'
    end
  end

  resources :check_items, only:[:create]
end
