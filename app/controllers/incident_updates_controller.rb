class IncidentUpdatesController < ApplicationController
  before_action :set_incident_updates, only: [:show, :edit, :update, :destroy]
  before_action :set_incident, only: [:new, :create, :edit, :update, :destroy]

  def show
  end

  def new
    @incident_update = IncidentUpdate.new
  end

  def create
    @incident_update = IncidentUpdate.new(incident_update_params)
    @incident_update.incident = @incident
    @incident_update.user = current_user
    if @incident_update.save
      redirect_to incident_path(@incident)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @incident_update.update(incident_update_params)
    redirect_to incident_path(@incident)
  end

  def destroy
    @incident_update.destroy
    redirect_to incident_path(@incident)
  end

  private

  def set_incident_updates
    @incident_update = IncidentUpdate.find(params[:id])
  end

  def set_incident
    @incident = Incident.find(params[:incident_id])
  end

  def incident_update_params
    params.require(:incident_update).permit(
      :created_at,
      :notes,
      :incident_status,
      :user,
      documents: []
    )
  end
end
