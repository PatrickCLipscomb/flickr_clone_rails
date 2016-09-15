class AddUserTagsToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :user_tags, :integer, array: true, default: []
  end
end
