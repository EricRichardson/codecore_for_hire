Rails.application.routes.draw do
  resources :users do
    resources :profile
  end
  resources :sessions, only: [:create, :new, :destroy] do
    delete :destroy, on: :collection
  end
end
