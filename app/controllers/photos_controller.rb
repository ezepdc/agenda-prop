class PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]

  def destroy
    @photo.destroy
    redirect_to property_path(@photo.record), notice: 'Photo was successfully deleted.'
  end

  private
    def set_photo
      @photo = ActiveStorage::Attachment.find(params[:id])
    end
end
