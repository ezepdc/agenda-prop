class CreateBills < ActiveRecord::Migration[7.0]
  def change
    create_table :bills do |t|
      t.references :property, null: false, foreign_key: true
      t.date :bill_date
      t.string :kind
      t.references :contact, null: false, foreign_key: true
      t.integer :amount
      t.string :amount_currency
      t.string :concept
      t.string :payment_method
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
