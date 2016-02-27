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
  resources :sites
  resources :products do
      put :use, on: :member
      put :like, on: :member
      put :want, on: :member
      collection do #search will apply to more than one product
          get 'search'
      end
          resources :reviews, except: [:show, :index] #deleted show and index pages
          resources :photos
          resources :links

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


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
