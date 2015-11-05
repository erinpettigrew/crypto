class AddImageToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :product_photo, :string
  end
end
