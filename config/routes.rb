Rails.application.routes.draw do

  resources :posts
  resources :themes
  resources :skin_types
  resources :applicants
  resources :categories
  devise_for :users
  resources :users, :only => [:show, :index] do
      resources :avatars
      resources :profiles
    end
  resources :products do
      put :use, on: :member
      put :like, on: :member
      put :want, on: :member
      collection do # search will apply to more than one product
          get 'search'
      end
      resources :reviews, except: [:show, :index] #deleted show and index pages
      resources :photos
    end

  get 'pages/about'

  get '/join', to: 'applicants#new'

  get '/thanks', to: 'pages#thanks'

  # get 'pages/contact'
  #set homepage as login / signup page
  authenticated :user do
    root to: 'products#index', as: :authenticated_root
  end

  root to: 'pages#about'

end
