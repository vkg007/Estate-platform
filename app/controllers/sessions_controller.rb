class SessionsController < ApplicationController
  def new
  end

  def create
    # Finding user Id with email associated with.
    @user = User.find_by(email: session_params[:email]) 

    # if/else, checks if the user password is correct or not, if its correct session starts
    if @user && @user.authenticate(session_params[:password]) 
      session[:user_id] = @user.id 
      flash[:success] = 'Log In successfully.' 
      redirect_to root_url

     # If not, an error is displayed and the user is redirected to the login page.
    else 
      flash[:error] = 'Invalid email/password combination'
      redirect_to login_path
    end
  end
 
  def session_params
    params.require(:session).permit(:email, :password)
  end
 
   # Destroying session and redirect to Index page 
  def destroy
    reset_session
    redirect_to root_path
  end
end
