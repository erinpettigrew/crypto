class RemoveTypeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :type, :text
  end
end
