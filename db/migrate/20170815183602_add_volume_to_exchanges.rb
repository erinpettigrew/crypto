class AddVolumeToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :volume, :string
  end
end
