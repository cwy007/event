Rails.application.routes.draw do

  devise_for :users

  resources :events

  namespace :admin do
    root "events#index"
    resources :events
    resources :categories
    resources :users
  end

  resource :user

  root "events#index"

end
