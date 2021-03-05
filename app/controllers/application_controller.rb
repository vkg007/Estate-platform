class ApplicationController < ActionController::Base
  helper_method :current_user

  # Method for getting assining user.id to current_user if User is not false or nil.
  def current_user
    if session[:user_id]
      @current_user = @current_user || User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
