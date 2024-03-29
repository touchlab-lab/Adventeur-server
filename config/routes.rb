Adventeur::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  namespace :api do
    namespace :v1 do
      resources :registrations, :only => :create
      resources :checkin, :only => :create
    end
  end
  devise_for :users
  resources :users, :only => :show
  resources :adventures
  resources :checkpoints
  match '/api/v1/search/nearest', :to => "api/v1/search#nearest"
  match '/api/v1/search/intersect', :to => "api/v1/search#intersect"
  match '/app' => redirect("https://play.google.com/store/apps/details?id=co.aventeur.android" ), :as => :app 
end
