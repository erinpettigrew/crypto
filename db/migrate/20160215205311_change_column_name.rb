class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :profiles, :type, :skin_type
  end
end
