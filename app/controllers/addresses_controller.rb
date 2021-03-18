class AddressesController < ApplicationController
  before_action :find_addressable
  before_action :find_address, only: %i[edit update destroy]

  def new
    @address = @addressable.addresses.new if params[:user_id]
    @address = Address.new if params[:property_id]
  end

  def index
    @addresses = @addressable.addresses
  end

  def edit; end

  def create
    @address = @addressable.addresses.new(address_params) if params[:user_id]
    @address = @addressable.build_address(address_params) if params[:property_id]

    if @address.save
      flash[:success] = 'Address details saved successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Address details not saved successfully.'
      render :new
    end
  end

  def update
    if @address.update(address_params)
      flash[:success] = 'Address details Edited successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Address details not Edited successfully.'
      render :new
    end
  end

  def destroy
    if @address.destroy
      flash[:success] = 'Address details deleted successfully.'
      redirect_to root_path
    else
      flash[:error] = 'Address details not deleted successfully.'
      render :index
    end
  end

  private

  def address_params
    params.require(:address).permit(:city, :pincode, :full_address)
  end

  def find_address
    @address = @addressable.addresses.find_by_id(params[:id]) if params[:user_id]
    @address = @addressable.address if params[:property_id]
    return if @address

    flash[:error] = 'Address Not Found'
    redirect_to root_path
  end

  def find_addressable
    if params[:user_id]
      @addressable = User.find_by_id(params[:user_id])
      return if current_user == @addressable

      flash[:error] = "You don't have rights"
      redirect_to root_path
    elsif params[:property_id]
      @addressable = Property.find_by_id(params[:property_id])
    end
  end
end
