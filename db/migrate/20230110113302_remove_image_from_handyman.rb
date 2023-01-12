class RemoveImageFromHandyman < ActiveRecord::Migration[7.0]
  def change
    remove_column :handymen, :image
  end
end
