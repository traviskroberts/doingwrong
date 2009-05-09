class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all
  protect_from_forgery
  
  protected
  def rescue_action_in_public(ex) 
    if ex.is_a? ActiveRecord::RecordNotFound or ex.is_a? ActionController::UnknownAction or ex.is_a? ActionController::RoutingError
	    render :template => "default/404", :status => '404 Not Found' 
	  else 
	    super 
	  end 
	end
end
