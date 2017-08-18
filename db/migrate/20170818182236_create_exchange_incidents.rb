class CreateExchangeIncidents < ActiveRecord::Migration
  def change
    create_table :exchange_incidents do |t|
      t.integer :exchange_id
      t.integer :incident_id
    end
  end
end
