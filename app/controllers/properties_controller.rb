class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @pagy, @properties = pagy(Property.all)
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

  # def download
  #   require "cloudinary"

    # Cloudinary.config do |config|
    #   config.cloud_name = "your_cloud_name"
    #   config.api_key = "your_api_key"
    #   config.api_secret = "your_api_secret"
    # end

  #   public_id = "my_file"
  #   save_location = "downloads/my_file.jpg"

  #   Cloudinary::Uploader.download(public_id, save_location)
  # end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(
      :reference,
      :owner_id,
      :cadastral_reference,
      :kind,
      :address,
      :apartment,
      :city,
      :state,
      :country,
      :postal_code,
      :total_area,
      :covered_area,
      :rooms,
      :bathrooms,
      :amenities,
      :price,
      :price_currency,
      :notes,
      photos: []
    )
  end
end
