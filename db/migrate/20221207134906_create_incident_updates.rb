class CreateIncidentUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :incident_updates do |t|
      t.references :incident, null: false, foreign_key: true
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
