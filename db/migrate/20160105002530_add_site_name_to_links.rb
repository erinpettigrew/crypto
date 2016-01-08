class AddSiteNameToLinks < ActiveRecord::Migration
  def change
    add_column :links, :site_name, :text
  end
end
