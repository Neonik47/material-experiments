# -*- encoding : utf-8 -*-
Library::Application.routes.draw do




  resources :element_experiments


  resources :elements


  resources :images

  resources :sources

  resources :experiments_impacts_params

  resources :impacts_params

  resources :nodes

  resources :impacts

  resources :experiments do
    member do
      get :accept
      get :decline
      get :check
      get :set_cookie
      get :generate_pdf
      get :set_deleted
      get :set_undeleted
    end
    collection do
      get :checklist
      get :reset_cookie
      get :compare
    end
  end



  resources :users
  resources :sessions
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login

  #match 'show_to_confirm' => 'experiments#show_to_confirm', :as => :my_confirmation
  match 'confirm' => 'experiments#confirm', :as => :confirm

  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to contro  ller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'experiments#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
