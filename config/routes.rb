Rails.application.routes.draw do
  devise_for :users
  root 'landing#index'
  get 'landing/index'
  resources :tweets

end
