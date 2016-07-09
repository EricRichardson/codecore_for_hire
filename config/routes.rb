Rails.application.routes.draw do
  resources :users do
    resources :profiles
  end
  resources :educations

end
