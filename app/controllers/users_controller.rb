class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 

    # if user get save succesully else  again transmit to sign up page
    if @user.save
      session[:user_id] = @user.id
      flash[:success] =  'You have successfully created an account!'
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation, :pic)
  end
end
