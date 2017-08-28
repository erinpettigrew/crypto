class AddAskPriceToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :ask_price, :float
  end
end
