Rails.application.routes.draw do
  root 'users#new'
  resources :users do
    resources :profiles
  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end

  resources :password_resets, only: [:new, :create, :edit, :update]

end
