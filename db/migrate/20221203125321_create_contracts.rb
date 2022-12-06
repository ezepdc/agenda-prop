class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :kind
      t.references :property, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.string :base_price
      t.string :base_price_currency
      t.string :comision
      t.string :guarantor_identity_kind
      t.string :guarantor_identity_number
      t.string :guarantee_address
      t.string :security_deposit_amount
      t.string :security_deposit_amount_currency
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
