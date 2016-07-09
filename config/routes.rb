Rails.application.routes.draw do
  root 'users#new'
  resources :users do

   resources :profiles do
      resources :experiences, only: [:create, :edit, :update, :destroy]
      resources :projects, only: [:create, :edit, :update, :destroy]
      resources :educations, only: [:create, :edit, :update, :destroy]
      resources :password_resets, only: [:new, :create, :edit, :update]

    end
  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end


end
