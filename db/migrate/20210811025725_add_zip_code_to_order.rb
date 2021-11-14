class AddZipCodeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :zip_code, :string
  end
end
