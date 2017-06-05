Rails.application.routes.draw do

  devise_for :users

  resources :events

  namespace :admin do
    root "events#index"
    resources :events do
      resources :tickets, :controller => "event_tickets"

      member do
        post :reorder
      end
      
      collection do
        post :bulk_update
      end
    end
    resources :categories
    resources :users do
      resource :profile, :controller => "user_profiles" #自定义命名controller
    end
    resources :groups
  end

  resource :user

  root "events#index"

end
