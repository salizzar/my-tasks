ActionController::Routing::Routes.draw do |map|
  map.devise_for :users, :path_names => { :sign_in => 'login', :sign_out => 'logout' }

  map.resources :users do |u|
    u.resources :lists, :namespace => 'users/', :path_prefix => nil, :name_prefix => nil
  end
 
  map.root :controller => 'users/lists'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
