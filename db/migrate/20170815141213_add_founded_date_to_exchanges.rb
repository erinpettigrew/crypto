class AddFoundedDateToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :founded_date, :string
  end
end
