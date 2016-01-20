class AddExcerptToLinks < ActiveRecord::Migration
  def change
    add_column :links, :excerpt, :text
  end
end
