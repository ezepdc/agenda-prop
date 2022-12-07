class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.references :property, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.string :kind
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
