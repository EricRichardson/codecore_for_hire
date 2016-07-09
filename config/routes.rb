Rails.application.routes.draw do
  resources :users do

    resources :profile, only: [:new, :create, :update, :destroy] do
      resources :experience, only: [:create, :edit, :update, :destroy]

  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection

  end

end
