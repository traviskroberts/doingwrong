ActionController::Routing::Routes.draw do |map|
  
  map.with_options :controller => 'default' do |m|
    m.home '', :action => 'index'
    m.archives 'archives/:page', :action => 'archives', :requirements => {:page => /\d+/}, :page => nil
  end
  
  map.entry_details 'entry/:id/:slug', :controller => 'entries', :action => 'show'
  map.alt_entry_details 'entries/:id/:slug', :controller => 'entries', :action => 'show'
  map.vote 'entry/:id/vote/:vote', :controller => 'entries', :action => 'vote'
  
  map.simple_captcha 'simple_captcha/:action', :controller => 'simple_captcha'
  
  map.with_options :controller => 'sessions' do |m|
    m.login 'login', :action => 'new'
    m.logout 'logout', :action => 'destroy'
  end
  
  map.with_options :controller => 'users' do |m|
    m.signup 'signup', :action => 'new'
    m.register 'register', :action => 'create'
    m.activate 'activate/:activation_code', :action => 'activate', :activation_code => nil
  end
  
  map.resources :comments
  map.resources :entries, :member => { :approve => :get }
  map.resource :session
  map.resources :users
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
