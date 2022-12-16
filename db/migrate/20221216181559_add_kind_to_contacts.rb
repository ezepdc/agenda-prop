class AddKindToContacts < ActiveRecord::Migration[7.0]
  def change
    add_column :contacts, :kind, :integer
  end
end
