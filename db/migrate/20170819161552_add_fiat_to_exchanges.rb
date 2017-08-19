class AddFiatToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :fiat, :boolean
  end
end
