class CreateIncidentUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :incident_updates do |t|
      t.references :incident, null: false, foreign_key: true
      t.text :notes
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
