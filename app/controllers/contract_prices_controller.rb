class ContractPricesController < ApplicationController
  before_action :set_contract_price, only: [:show, :edit, :update, :destroy]
  before_action :set_contract, only: [:new, :create, :edit, :update, :destroy]

  def show
  end

  def new
    @contract_price = ContractPrice.new
  end

  def create
    @contract_price = ContractPrice.new(contract_price_params)
    @contract_price.contract = @contract
    @contract_price.user = current_user
    if @contract_price.save
      redirect_to contract_path(@contract)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @contract_price.update(contract_price_params)
    redirect_to contract_path(@contract)
  end

  def destroy
    @contract_price.destroy
    redirect_to contract_path(@contract)
  end

  private

  def set_contract_price
    @contract_price = ContractPrice.find(params[:id])
  end

  def set_contract
    @contract = Contract.find(params[:contract_id])
  end

  def contract_price_params
    params.require(:contract_price).permit(
      :start_date,
      :end_date,
      :price,
      :price_currency
    )
  end
end
