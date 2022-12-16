class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy]

  def index
    @incidents = Incident.all
    if params[:query] == "Todas"
      @incidents = Incident.all
    elsif params[:query].present? && params[:query] == "Pendiente"
      @incident_updates = IncidentUpdate.where(status: params[:query]) # Trae todas las pendientes pero se necesitan los ultimos updates que sean pendientes
      @incidents = Incident.all # Para filtrar los incidentes que no tienen updates. El problema es que trae todos y no el ultimo
    else
      @incident_updates = IncidentUpdate.where(status: params[:query])
    end
  end

  def show
    @incident_last = IncidentUpdate.where(incident_id: params[:id]).last
    @incident_updates = IncidentUpdate.where(incident_id: params[:id]).order(created_at: :desc)
  end

  def new
    @incident = Incident.new
  end

  def create
    @incident = Incident.new(incident_params)
    @incident.user = current_user
    if @incident.save
      redirect_to incident_path(@incident)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @incident.update(incident_params)
    redirect_to incident_path(@incident)
  end

  def destroy
    @incident.destroy
    redirect_to incidents_path
  end

  private

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def incident_params
    params.require(:incident).permit(
      :created_at,
      :property_id,
      :contact_id,
      :kind,
      :description,
      :user,
      documents: []
    )
  end
end
