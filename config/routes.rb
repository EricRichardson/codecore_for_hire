Rails.application.routes.draw do
  resources :users do
    resources :profile
  end
end
