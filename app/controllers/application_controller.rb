class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  protected

  def after_sign_in_path_for(resource)
    # return the path based on resource
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  
  

end
