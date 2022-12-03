class ChangeContactNameToProperties < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :contact_id, :owner_id
  end
end
