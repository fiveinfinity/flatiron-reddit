class RenamePostsCategories < ActiveRecord::Migration
  def change
    rename_table :posts_categories, :post_categories
  end
end
