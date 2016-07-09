Rails.application.routes.draw do
  root 'users#new'
  resources :users do
    resources :profiles, only: [:new, :create, :update, :destroy] do
      resources :experiences , only: [:create, :edit, :update, :destroy]
    end
  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end
  resources :educations

  resources :password_resets, only: [:new, :create, :edit, :update]

end
