class AddSlugToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :slug, :string
  end
end
