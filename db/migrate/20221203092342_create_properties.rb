class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :reference
      t.string :cadastral_reference
      t.string :kind
      t.string :address
      t.string :apartment
      t.string :city
      t.string :state
      t.string :country
      t.string :postal_code
      t.integer :total_area
      t.integer :covered_area
      t.integer :rooms
      t.integer :bathrooms
      t.string :amenities
      t.monetize :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.references :owner, foreign_key: { to_table: :contacts }

      t.timestamps
    end
  end
end
