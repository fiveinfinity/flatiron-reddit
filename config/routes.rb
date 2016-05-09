Rails.application.routes.draw do

  root 'posts#index'
  resources :posts
  devise_for :users

  post 'sort_newest', to: 'posts#sort_newest'
  post 'sort_oldest', to: 'posts#sort_oldest'
  post 'sort_most', to: 'comments#sort_most'
  post 'sort_least', to: 'comments#sort_least'
  post 'search', to: 'posts#search'
  
  delete 'comments/destroy/:id', to: 'comments#destroy', as: 'destroy_comment'
  post 'comments/create', to: 'comments#create', as: 'create_comments'
  get 'users/:id/comments', to: 'comments#comments'
  get 'users/:id/comments/edit', to: 'comments#edit', as: 'edit_comment'
  patch 'users/:id/comments/edit', to: 'comments#update'
  get 'category/:id', to: 'categories#category', as: 'category'
  get '/users/:id/profile', to: 'sessions#profile', as: 'user_profile'
  get '/auth/facebook/callback' => 'sessions#create'

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
