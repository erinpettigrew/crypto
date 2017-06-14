class AddPlatformToProducts < ActiveRecord::Migration
  def change
    add_column :products, :platform, :string
  end
end
