class RemoveIntegerFromItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :integer, :string
  end
end
