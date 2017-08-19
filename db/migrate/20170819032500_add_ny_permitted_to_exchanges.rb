class AddNyPermittedToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :ny_permitted, :boolean
  end
end
