class AddPopularToWallets < ActiveRecord::Migration
  def change
    add_column :products, :popular, :boolean
    add_column :Products, :popular_more, :string
  end
end
