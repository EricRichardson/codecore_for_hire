Rails.application.routes.draw do
  root 'home#index'

  patch '/activate_user/:id' => 'activations#update', as: :user_activation

  delete '/activate_user/:id' => 'activations#delete'

  get "users/autocomplete" => "users#autocomplete"

  resources :users do
   resources :profiles do
      resources :experiences
      resources :projects
      resources :educations
      resources :skills
    end
  end
  resources :contact_forms, only: [:new, :create]

  resources :search do
    get "/advanced" => "search#advanced_form", on: :collection
    post "/advanced" => "search#advanced_search", on: :collection
  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end


  resources :password_resets, only: [:new, :create, :edit, :update]

  resources :contact_forms, only: [:new, :create]
end
