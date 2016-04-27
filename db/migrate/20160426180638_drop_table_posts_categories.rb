class DropTablePostsCategories < ActiveRecord::Migration
  def change
    rename_column :posts_categories, :category_id_id, :category_id
    rename_column :posts_categories, :post_id_id, :post_id
  end
end
