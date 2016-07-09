Rails.application.routes.draw do
  resources :users do
    resources :profile, only: [:new, :create, :update, :destroy] do
      resources :experience, only: [:create, :edit, :update, :destroy] 
  end

end
