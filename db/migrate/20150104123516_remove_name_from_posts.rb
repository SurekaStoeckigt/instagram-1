class RemoveNameFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :description, :text
  end
end
