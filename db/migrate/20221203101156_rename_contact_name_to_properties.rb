class RenameContactNameToProperties < ActiveRecord::Migration[7.0]
  def change
    rename_column :properties, :owner_id, :contact_id
  end
end
