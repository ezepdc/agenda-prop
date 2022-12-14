class SettlementsController < ApplicationController
  before_action :set_settlement, only: [:show, :edit, :update, :destroy]

  def index
    @settlements = Settlement.all
  end

  def show
  end

  def new
    @settlement = Settlement.new
  end

  def create
    @settlement = Settlement.new(settlement_params)
    @settlement.user = current_user
    if @settlement.save
      redirect_to settlement_path(@settlement)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @settlement.update(settlement_params)
    redirect_to settlement_path(@settlement)
  end

  def destroy
    @settlement.destroy
    redirect_to settlements_path
  end

  private

  def set_settlement
    @settlement = Settlement.find(params[:id])
  end

  def settlement_params
    params.require(:settlement).permit(
      :property_id,
      :bill_id,
      :others_income_amount,
      :others_income_amount_curreny,
      :others_income_concept,
      :others_expense_amount,
      :others_expense_amount_currency,
      :others_expense_concept,
      :amount,
      :amount_currency,
      :payment_method,
      :notes,
      :user_id,
      :created_at,
      documents: []
    )
  end
end
