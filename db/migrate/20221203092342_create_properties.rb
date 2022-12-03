class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :property_reference
      t.references :contact, null: false, foreign_key: true
      t.string :cadastral_reference
      t.string :kind
      t.string :address
      t.string :apartment
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :total_area
      t.string :covered_area
      t.integer :rooms
      t.integer :bathrooms
      t.string :amenities
      t.string :price
      t.string :price_currency
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
