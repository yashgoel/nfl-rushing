Rails.application.routes.draw do
  get 'nfl/index'

  resources :players

  root 'nfl#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
