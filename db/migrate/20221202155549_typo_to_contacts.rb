class TypoToContacts < ActiveRecord::Migration[7.0]
  def change
    rename_column :contacts, :emai, :email
  end
end
