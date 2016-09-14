class AddFavoriteImagesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_images, :integer, array: true, default: []
  end
end
