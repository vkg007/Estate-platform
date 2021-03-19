class SessionsController < ApplicationController
 
  def new; end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password]) # Safe navigation Operator
      session[:user_id] = @user.id
      flash[:success] = 'Log In successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Invalid email/password combination'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
