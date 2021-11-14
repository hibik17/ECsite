class RemoveZipcodeFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :zipcode, :string
  end
end
