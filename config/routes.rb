Rails.application.routes.draw do

  get '/availabilities', to: 'availabilities#show'

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
