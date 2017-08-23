class AddPopularToWallets < ActiveRecord::Migration
  def change
    add_column :products, :popular, :boolean
    add_column :products, :popular_more, :string
  end
end
