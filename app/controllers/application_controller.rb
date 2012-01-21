# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  # You can move this into a different controller, if you wish.  This module gives you the require_role helpers, and others.
  include RoleRequirementSystem

  before_filter :test

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :authenticate
  
  private 
  def authenticate
    #authenticate_or_request_with_http_basic do |name, password|
    #  (name == "username" && password == "password")
    #end
  end
  
  

  protected
    def test
      @user = current_user
    end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
