Rails.application.routes.draw do
  resources :users do
    resources :profiles
  end

  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end

end
