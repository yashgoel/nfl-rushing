Rails.application.routes.draw do
  resources :nfl, only: [:index]

  root 'nfl#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
