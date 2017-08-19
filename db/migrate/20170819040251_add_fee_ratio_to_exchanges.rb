class AddFeeRatioToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :fee_ratio, :string
  end
end
