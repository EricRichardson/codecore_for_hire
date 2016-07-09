Rails.application.routes.draw do
  resources :users do
  end
  resources :profiles do
    resources :projects
  end
end
