ActionController::Routing::Routes.draw do |map|
  map.resources :roles

  map.resources :kbarticles

  map.resources :kbcomments

  map.resources :kblangs

  map.resources :kbcats

  map.resources :filedatas

  map.resources :folders

  map.resources :caldates

  map.resources :datetasks

  map.resources :dateprios

  map.resources :datestatuses

  map.resources :datearts

  map.resources :parts

  map.resources :products

  map.resources :companyarts

  map.resources :adresses

  map.resources :dashblogs, :collection => {:list_next => :get, :list_previous => :get }

  map.resources :companies

  map.resources :accounts

  map.resource :session

  map.resources :contacts
  map.resources :dashboards
  map.resources :errors

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.signup '/signup', :controller => 'accounts', :action => 'new'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.error '/error', :controller => 'errors', :action => 'aclerror'
  map.denied '/denied', :controller => 'errors', :action => 'acldenied'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :controller => 'dashboards'
end
