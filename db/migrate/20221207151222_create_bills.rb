class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :property, null: false, foreign_key: true
      t.date :bill_date
      t.references :contact, null: false, foreign_key: true
      t.monetize :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.string :concept
      t.string :payment_method
      t.integer :kind
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
