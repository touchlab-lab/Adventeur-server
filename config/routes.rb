Adventeur::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  namespace :api do
    namespace :v1 do
      resources :registrations, :only => :create
    end
  end
  devise_for :users
  resources :users, :only => :show
  resources :adventures

  
  
end
