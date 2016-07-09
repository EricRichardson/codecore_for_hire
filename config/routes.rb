Rails.application.routes.draw do
  root 'users#index'
  resources :users do
   resources :profiles do
      resources :experiences, only: [:create, :edit, :update, :destroy]
      resources :projects, only: [:create, :edit, :update, :destroy]
      resources :educations, only: [:create, :edit, :update, :destroy]

      resources :skills
    end
  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end
resources :password_resets, only: [:new, :create, :edit, :update]
end
