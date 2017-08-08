class AddAboutToCurrencies < ActiveRecord::Migration
  def change
    add_column :currencies, :about, :string
  end
end
