class AddTickerToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :ticker, :string
  end
end
