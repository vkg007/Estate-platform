class ContractsController < ApplicationController
  before_action :find_user
  before_action :find_contract, only: %i[show edit update destroy]

  def index
    @contracts = @user.contracts.includes(:property)
    return if @contracts

    flash[:error] = 'Contract Not Found'
    redirect_to root_path
  end

  def show
    @contract = Contract.single_contract_detail(params[:id])
    return if @contract

    flash[:error] = 'Contract Not Found'
    redirect_to root_path
  end

  def new
    @contract = @user.contracts.new
  end

  def create
    @contract = @user.contracts.build(contracts_params)
    if @contract.save
      ContractJob.perform_later(@contract.id)
      flash[:success] = 'Contract details inserted successfully!'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @contract.update(contracts_params)
      flash[:success] = 'Contract details Edited successfully.'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @contract.destroy
      respond_to do |format|
        format.js
      end
    else
      flash[:error] = 'Contract not deleted successfully.'
      render :index
    end
  end

  private

  def contracts_params
    params.require(:contract).permit(:final_price, :property_id, :start_date, :end_date, :transaction_id, :payment_mode,
                                     :contract_type, :details)
  end

  def find_contract
    @contract = @user.contracts.find_by_id(params[:id])
    return if @contract

    flash[:error] = 'Contract Not Found'
    redirect_to root_path
  end

  def find_user
    @user = User.find_by_id(params[:user_id])
    return if current_user == @user

    flash[:error] = 'User not found/You can edit only your details'
    redirect_to root_path
  end
end
