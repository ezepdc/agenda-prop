class CreateContractPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :contract_prices do |t|
      t.references :contract, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.monetize :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
