class RemoveDescriptionFromCustomers < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :description
  end
end
