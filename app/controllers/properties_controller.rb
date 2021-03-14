class PropertiesController < ApplicationController
  before_action :find_user
  before_action :find_property, only: %i[show edit update destroy]

  def new
    @property = @user.properties.build
  end

  def index
    @properties = @user.properties
  end

  def edit; end

  def create
    @property = @user.properties.build(property_params)
    if @property.save
      flash[:success] = 'Property details inserted successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @property.update(property_params)
      flash[:success] = 'Property details Edited successfully.'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @property.destroy
      flash[:success] = 'Property details deleted successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Property details not deleted successfully.'
      render :edit
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :built_area, :user_id, :carpet_area, :posted_date, :available_for,
                                     :floor_no, :type_of, :total_floor, :age, :bedrooms, :bathrooms, :balcony,
                                     :parking_area, :description)
  end

  def find_property
    @property = @user.properties.find(params[:id])
  end

  def find_user
    @user = User.find_by_id(params[:user_id])
    return if current_user == @user

    flash[:error] = 'User not found/You can edit only your details'
    redirect_to root_path
  end
end
