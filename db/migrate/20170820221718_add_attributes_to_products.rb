class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :location, :string
    add_column :products, :founded_date, :string
    add_column :products, :access_private_keys, :boolean
  end
end
