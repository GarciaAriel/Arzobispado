Rails.application.routes.draw do


  resources :surveys

  resources :events

  #devise_for :users
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end


  resources :comments
  resources :post_attatchments


  get 'welcome/index'

  resources :eventos
  resources :posts

  # get 'eventos/form'
  # post 'eventos/form'
  # get 'eventos/index'
  # post 'eventos/index'
  # get 'eventos/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'eventos#index'
   get 'posts/algo' => 'posts#algo'
   get 'welcome/menu' => 'welcome#menu'
   post 'comments/:id' => 'comments#update'
   get 'layouts/events_sub' => 'welcome#menu'
   get 'posts/new/:id' => 'posts#new', as: 'new_post_id'
   get 'posts/index/:id' => 'posts#index', as: 'posts_index'
   get 'post_attatchments/download/:id' => 'post_attatchments#download'
   get 'post_attatchments/new/:id' => 'post_attatchments#new', as: 'new_post_attatchment_id'
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
