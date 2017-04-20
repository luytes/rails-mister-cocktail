Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: [ :new, :create, :destroy, :edit ]
  end
  # resources :doses, only: [ :show, :edit, :update, :destroy ]
end
