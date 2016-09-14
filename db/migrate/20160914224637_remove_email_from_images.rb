class RemoveEmailFromImages < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :email, :string
  end
end
