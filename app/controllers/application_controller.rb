class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include Pundit
  
  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  


  

end
