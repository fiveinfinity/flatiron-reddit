Rails.application.routes.draw do

  root 'posts#index'
  resources :posts
  devise_for :users
  resources :users, only: [:show] do
    resources :comments, only: [:edit, :update, :index, :create, :destroy]
  end

  #######ROUTES FOR SORTING AND SEARCH FEATURES############


  post '/posts/time', to: 'posts#time'
  post '/posts/find_author', to: 'posts#find_author'
  post '/comments/find', to: 'comments#find'

  get 'search', to: 'posts#search'
  get 'category/:id', to: 'categories#category', as: 'category'
  get '/users/:id/profile', to: 'sessions#profile', as: 'user_profile'
  get '/auth/facebook/callback' => 'sessions#create'

  get 'sort_newest', to: 'posts#sort_newest'
  get 'sort_oldest', to: 'posts#sort_oldest'
  get 'sort_most', to: 'posts#sort_most'
  get 'sort_least', to: 'posts#sort_least'

  get 'upvote/:id', to: 'posts#upvote'
  get 'downvote/:id', to: 'posts#downvote'

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
