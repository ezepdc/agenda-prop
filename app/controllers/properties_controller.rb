class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
  end

  def show
    @contracts = Contract.where(property_id: params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to property_path(@property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @property.update(property_params)
    redirect_to property_path(@property)
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:property_reference, :owner_id, :cadastral_reference, :kind, :address, :apartment, :city, :state, :country, :postal_code, :total_area, :covered_area, :rooms, :bathrooms, :amenities, :price, :price_currency, :notes)
  end
end
