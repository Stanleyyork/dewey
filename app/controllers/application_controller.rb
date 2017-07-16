class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def homepage
  	respond_to do |format|
      format.html { render :template => "layouts/homepage" }
    end
  end
end
