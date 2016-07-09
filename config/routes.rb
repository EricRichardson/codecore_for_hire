Rails.application.routes.draw do
  resources :users do
    resources :profiles, only: [:new, :create, :update, :destroy] do
      resources :experiences , only: [:create, :edit, :update, :destroy]
    end
  end

  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection



end
