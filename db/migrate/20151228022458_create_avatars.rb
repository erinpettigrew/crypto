class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :user_id
      t.string :image

      t.timestamps null: false
    end
  end
end
