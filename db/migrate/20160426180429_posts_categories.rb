class PostsCategories < ActiveRecord::Migration
  def change
    create_table :posts_categories do |t|
      t.belongs_to :category_id
      t.belongs_to :post_id
    end
  end
end
