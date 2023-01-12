class FilesController < ApplicationController
  before_action :set_file, only: [:destroy]

  def destroy
    @file.destroy
    redirect_to property_path(@file.record), notice: 'File was successfully deleted.'
  end

  private

  def set_file
    @file = ActiveStorage::Attachment.find(params[:id])
  end
end
