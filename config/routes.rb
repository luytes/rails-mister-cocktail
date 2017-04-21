Rails.application.routes.draw do
  root 'pages#home'
  resources :cocktails do
    resources :doses, only: [ :new, :create, :destroy, :edit ]
  end
  resources :ingredients, only: [ :show ]
  # resources :doses, only: [ :show, :edit, :update, :destroy ]
end
