class PropertiesController < ApplicationController
  before_action :find_property, only: %i[edit update]
  def new
    @property = Property.new
  end
 
  def edit; end

  def create
    @property = Property.new(property_params)
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
    @property = Property.find(current_user.id)
    if @property.destroy
      flash[:success] = 'Property details deleted successfully.'
      redirect_to root_path
    else
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
    @property = Property.find(params[:id])
  end
end
