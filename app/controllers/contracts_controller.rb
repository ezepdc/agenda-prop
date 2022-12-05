class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  def index
    @contracts = Contract.all
  end

  def show
    @contract_prices = ContractPrice.where(contract_id: params[:id])
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    @contract.user = current_user
    if @contract.save
      redirect_to contract_path(@contract)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @contract.update(contract_params)
    redirect_to contract_path(@contract)
  end

  def destroy
    @contract.destroy
    redirect_to contracts_path
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:kind, :property_id, :contact_id, :start_date, :end_date, :base_price, :base_price_currency, :comision, :guarantor_identity_kind, :guarantor_identity_number, :guarantee_address, :security_deposit_amount, :security_deposit_amount_currency, :notes)
  end
end
