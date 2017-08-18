class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.integer :investor_id
      t.integer :exchange_id
    end
  end
end
