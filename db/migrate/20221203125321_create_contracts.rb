class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :kind
      t.references :property, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.monetize :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.string :comision
      t.string :guarantor_identity_kind
      t.string :guarantor_identity_number
      t.string :guarantee_address
      t.monetize :security_deposit_amount, amount: { null: true, default: nil }, currency: { null: true, default: nil }
      t.text :notes
      t.references :user, null: false, foreign_key: true
      t.references :tenant, foreign_key: { to_table: :contacts }
      t.references :guarantor, foreign_key: { to_table: :contacts }

      t.timestamps
    end
  end
end
