class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = Bill.all
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)
    @bill.user = current_user
    if @bill.save
      redirect_to bill_path(@bill)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @bill.update(bill_params)
    redirect_to bill_path(@bill)
  end

  def destroy
    @bill.destroy
    redirect_to bills_path
  end

  private

  def set_bill
    @bill = Bill.find(params[:id])
  end

  def bill_params
    params.require(:bill).permit(:property_id, :bill_date, :kind, :contact_id, :amount, :amount_currency, :concept, :payment_method, :notes, :settlement_id, :user, :created_at)
  end
end
