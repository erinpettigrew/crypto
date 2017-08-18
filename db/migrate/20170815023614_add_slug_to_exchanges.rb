class AddSlugToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :slug, :string
  end
end
