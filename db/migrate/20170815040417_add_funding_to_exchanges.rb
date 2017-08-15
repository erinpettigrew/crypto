class AddFundingToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :bank_transfer, :boolean
    add_column :exchanges, :credit_card, :boolean
    add_column :exchanges, :paypal, :boolean
  end
end
