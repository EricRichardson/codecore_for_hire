Rails.application.routes.draw do
  root 'home#index'
  resources :users do
   resources :profiles do
      resources :experiences
      resources :projects
      resources :educations
      resources :skills
      
      resources :contact_forms, only: [:new, :create]
    end
  end

  resources :search, param: :search

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end
resources :password_resets, only: [:new, :create, :edit, :update]
resources :contact_forms, only: [:new, :create]
end
