class DropLooks < ActiveRecord::Migration
  def change
    drop_table :looks
  end
end
