class PropertiesController < ApplicationController
  before_action :find_user, except: %i[show search]
  before_action :find_user_property, only: %i[edit update destroy]

  def index
    @properties = @user.properties
    return if @properties

    flash[:error] = 'User has no property.'
    redirect_to root_path
  end

  def show
    @property = Property.includes(:user).find_by_id(params[:id])
    return if @property

    flash[:error] = 'property Not Found'
    redirect_to root_path
  end

  def new
    @property = @user.properties.build
  end

  def edit; end

  def create
    @property = @user.properties.build(property_params)
    if @property.save
      flash[:success] = 'Property details inserted successfully!'
      redirect_to new_property_address_path(@property)
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
      respond_to do |format|
        format.js
      end
    else
      flash[:error] = 'Property details not deleted successfully.'
      render :index
    end
  end

  def result; end

  def search
    if params[:search].blank?
      flash[:error] = 'property blank'
      redirect_to root_path
    else
      @search_val = params[:search]
      @properties = Property.all.includes(:user).where('title LIKE ?', "%#{@search_val}%")
      if @properties
        render :result
      else
        flash[:error] = 'property not found'
        redirect_to root_path
      end
    end
  end

  private

  def property_params
    params.require(:property).permit(:title, :built_area, :carpet_area, :posted_date, :available_for,
                                     :floor_no, :type_of, :total_floor, :age, :bedrooms, :bathrooms, :balcony,
                                     :parking_area, :description, images: [])
  end

  def find_user_property
    @property = @user.properties.find_by_id(params[:id])
    return if @property

    flash[:error] = 'property Not Found'
    redirect_to root_path
  end

  def find_user
    @user = User.find_by_id(params[:user_id])
    return if current_user == @user

    flash[:error] = 'User not found/You can edit only your details'
    redirect_to root_path
  end
end
