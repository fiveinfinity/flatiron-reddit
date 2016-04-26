class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content
      t.string :author
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
