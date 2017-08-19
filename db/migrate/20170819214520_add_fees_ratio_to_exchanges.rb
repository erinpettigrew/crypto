class AddFeesRatioToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :fees_ratio, :float
  end
end
