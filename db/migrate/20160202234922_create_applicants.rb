class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :email
      t.text :info

      t.timestamps null: false
    end
  end
end
