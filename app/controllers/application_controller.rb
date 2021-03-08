class ApplicationController < ActionController::Base
  helper_method :current_user

  # Method for  assining user.id to current_user if User is not false or nil in database.
  def current_user
    if session[:user_id]  && !User.find(session[:user_id]).nil?
      @current_user = @current_user || User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
