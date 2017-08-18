class AddImagesToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :image, :string
  end
end
