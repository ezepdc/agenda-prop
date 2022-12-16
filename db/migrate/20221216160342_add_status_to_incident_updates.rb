class AddStatusToIncidentUpdates < ActiveRecord::Migration[7.0]
  def change
    add_column :incident_updates, :status, :integer, default: 0
  end
end
