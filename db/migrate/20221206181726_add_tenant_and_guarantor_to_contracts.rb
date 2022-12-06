class AddTenantAndGuarantorToContracts < ActiveRecord::Migration[7.0]
  def change
    add_reference :contracts, :tenant, foreign_key: { to_table: :contacts }
    add_reference :contracts, :guarantor, foreign_key: { to_table: :contacts }
  end
end
