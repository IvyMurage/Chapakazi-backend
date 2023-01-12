class AddImageToHandymen < ActiveRecord::Migration[7.0]
  def change
    add_column :handymen, :image, :string
  end
end
