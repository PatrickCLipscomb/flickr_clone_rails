class AddDescriptionToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :description, :string
  end
end
