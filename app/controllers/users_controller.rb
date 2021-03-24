class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_now
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully created an account!'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user&.authenticate(user_update_params[:old_password])
      if @user.update(user_params)
        flash[:success] = 'Edited successfully.'
        redirect_to root_path
      else
        render :edit
      end
    else
      flash[:error] = 'Invalid password'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile, :password, :password_confirmation, :image)
  end

  def user_update_params
    params.require(:user).permit(:old_password)
  end

  def find_user
    @user = User.find_by_id(params[:id])
    return if current_user == @user

    flash[:error] = 'User not found/You can edit only your details'
    redirect_to root_path
  end
end
