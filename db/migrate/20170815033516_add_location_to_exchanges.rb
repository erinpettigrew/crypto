class AddLocationToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :location, :string
  end
end
