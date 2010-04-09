ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'

  map.resources :users

  map.resource :session


  map.connect "/admin/archive/:action/:id", :controller => "nspirefiles"
  map.connect "/admin/posts/:action/:id", :controller => "posts"
  map.connect "/admin/upload/:action/:id", :controller => "upload"
  map.search "/nspire/search/", :controller => "nspire", :action => "index"
  
  map.resources :nspirefiles
  map.resources :posts

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :controller => 'home'
end
