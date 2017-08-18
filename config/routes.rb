Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/availabilities', to: 'availabilities#show'
  get '/products/newadmin', to: 'products#newadmin'
  resources :posts
  resources :themes
  resources :categories
  resources :currencies
  resources :exchanges
  resources :investors
  resources :incidents
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: "sessions" }
  resources :users, :only => [:show, :index, :update] do
      resources :avatars
    end
  resources :products do
      resources :uses
      post 'uses/toggle', to: 'uses#toggle'
      put :like, on: :member
      put :want, on: :member
      collection do # search will apply to more than one product
          get 'search'
      end
      resources :reviews, except: [:show, :index]
      resources :photos
    end

  authenticated :user do
    root to: 'exchanges#index', as: :authenticated_root
  end

  root to: 'exchanges#index'
end
