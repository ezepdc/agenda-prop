class ChangeTypeColumnToContacts < ActiveRecord::Migration[7.0]
  def change
    rename_column :contacts, :contact_type, :kind
  end
end
