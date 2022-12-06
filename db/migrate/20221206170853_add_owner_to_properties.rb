class AddOwnerToProperties < ActiveRecord::Migration[7.0]
  def change
    add_reference :properties, :owner, foreign_key: { to_table: :contacts }
  end
end
