class AddKindToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :kind, :integer
  end
end
