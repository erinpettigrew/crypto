class AddTempFeeRatioToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :temp_fee_ratio, :string
  end
end
