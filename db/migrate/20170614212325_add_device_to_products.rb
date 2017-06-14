class AddDeviceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :device, :string
  end
end
