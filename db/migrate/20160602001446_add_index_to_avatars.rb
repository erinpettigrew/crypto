class AddIndexToAvatars < ActiveRecord::Migration
  def change
    add_index :avatars, :user_id
  end
end
