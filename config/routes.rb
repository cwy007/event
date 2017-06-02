Rails.application.routes.draw do

  devise_for :users

  resources :events

  namespace :admin do
    root "events#index"
    resources :events
    resources :categories
    resources :users do
      resource :profile, :controller => "user_profiles" #自定义命名controller
    end
    resources :groups
  end

  resource :user

  root "events#index"

end
