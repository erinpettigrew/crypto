Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get '/availabilities', to: 'availabilities#show'
  get '/insta', to: 'looks#show', :id => '18'
  get '/sparkle', to: 'looks#show', :id => '6'
  get '/clutch', to: 'looks#show', :id => '20'
  get '/eyes', to: 'looks#show', :id => '19'
  get '/burning-man', to: 'looks#show', :id => '18'
  get '/rose', to: 'looks#show', :id => '9'
  get '/blush', to: 'looks#show', :id => '14'
  get '/products/newadmin', to: 'products#newadmin'
  get '/ingredients', to: 'ingredients#index'
  resources :posts
  resources :themes
  resources :skin_types
  resources :applicants
  resources :categories
  resources :brands
  resources :looks
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", sessions: "sessions" }
  resources :users, :only => [:show, :index, :update] do
      resources :avatars
      resources :profiles
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

  get 'pages/login'

  get '/join', to: 'applicants#new'

  get '/thanks', to: 'pages#thanks'

  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  root to: 'products#index'
end
