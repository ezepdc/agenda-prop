class CreateSettlements < ActiveRecord::Migration[7.0]
  def change
    create_table :settlements do |t|
      t.references :property, null: false, foreign_key: true
      t.references :bill, null: false, foreign_key: true
      t.string :others_income_concept
      t.monetize :others_income_amount, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.string :others_expense_concept
      t.monetize :others_expense_amount, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.monetize :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.string :payment_method
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
