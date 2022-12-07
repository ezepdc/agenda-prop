class IncidentUpdatesController < ApplicationController
  before_action :set_incident_updates, only: [:show, :edit, :update, :destroy]
  before_action :set_incident, only: [:new, :create, :edit, :update, :destroy]

  def show
  end

  def new
    @incident_updates = IndicentUpdates.new
  end

  def create
    @incident_updates = IndicentUpdates.new(incident_updates_params)
    @incident_updates.incident = @incident
    @incident_updates.user = current_user
    if @incident_updates.save
      redirect_to incident_path(@incident)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @incident_updates.update(incident_updates_params)
    redirect_to incident_path(@incident)
  end

  def destroy
    @incident_updates.destroy
    redirect_to incident_path(@incident)
  end

  private

  def set_incident_updates
    @incident_updates = IndicentUpdates.find(params[:id])
  end

  def set_incident
    @incident = incident.find(params[:incident_id])
  end

  def incident_updates_params
    params.require(:incident_updates).permit(:created_at, :notes, :incident_status, :user)
  end
end
