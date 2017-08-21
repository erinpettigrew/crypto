class AddUrlToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :url, :string
  end
end
