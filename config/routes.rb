Rails.application.routes.draw do

  get 'facebook/index'

  get 'home/new'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  
  get "retweet" => "twitter#re_tweet", :as => "retweet"
  get "twitter/search" => "twitter#search", :as => "twitter/search"
  get "twitter/home" => "twitter#home", :as => "twitter/home"
  resources :twitter, only: [:index, :create]


  get "instagram/home" => "instagram#home", :as => "instagram/home"
  post "instagram/search" => "instagram#search", :as => "instagram/search"
  post "instagram/search_by_user" => "instagram#search_by_user", :as => "instagram/search_by_user"
  post "instagram/like/:id" => "instagram#like", :as => "instagram/like"
  post "instagram/unlike/:id" => "instagram#unlike", :as => "instagram/unlike"  
  resources :instagram, only: [:index]

  post "reddit/search" => "reddit#search", :as => "reddit/search"  
  post "reddit/like" => "reddit#upvote", :as => "reddit/upvote"
  post "reddit/comments" => "reddit#comments", :as => "reddit/comments"
  resources :reddit, only: [:index]



  resources :users
  resources :sessions

  
  post "soundcloud/search" => "soundcloud#search", :as => "soundcloud/search"
  resources :soundcloud, only: [:index]
  
  resources :facebook, only: [:index ]


  get '/auth/:provider/callback' => 'authentications#create'
  resources :authentications, only: [:index, :destroy]
  
  root :to => "sessions#new"

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
