Rails.application.routes.draw do
  root 'home#index'
  get "users/autocomplete" => "users#autocomplete"
  resources :users do
   resources :profiles do
      resources :experiences
      resources :projects
      resources :educations
      resources :skills
<<<<<<< HEAD
=======
      
      resources :contact_forms, only: [:new, :create]
>>>>>>> adb0194fbd39392a78f28d39681b02280f995436
    end
  end
  resources :contact_forms, only: [:new, :create]

  resources :search, param: :search

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end
resources :password_resets, only: [:new, :create, :edit, :update]
resources :contact_forms, only: [:new, :create]
end
