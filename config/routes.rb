Rails.application.routes.draw do
  root 'home#index'
  resources :users do
   resources :profiles do
      resources :experiences, only: [:new, :create, :edit, :update, :destroy]
      resources :projects, only: [:new, :create, :edit, :update, :destroy]
      resources :educations, only: [:new, :create, :edit, :update, :destroy]

      resources :skills
    end
  end
  resources :contact_forms, only: [:new, :create]

  resources :search, param: :search

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end
resources :password_resets, only: [:new, :create, :edit, :update]
end
