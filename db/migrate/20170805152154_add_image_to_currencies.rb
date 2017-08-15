class AddImageToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :image, :string
  end
end
