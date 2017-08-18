class CreateIncidents < ActiveRecord::Migration
  def change
    create_table :incidents do |t|
      t.string :name
      t.timestamp :date
      t.string :url
      t.string :amount
    end
  end
end
