class ChangeFeeRatio < ActiveRecord::Migration
  def change
    change_column :exchanges, :fee_ratio, :float
  end
end
