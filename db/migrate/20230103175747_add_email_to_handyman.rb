class AddEmailToHandyman < ActiveRecord::Migration[7.0]
  def change
    add_column :handymen, :email, :string
  end
end
