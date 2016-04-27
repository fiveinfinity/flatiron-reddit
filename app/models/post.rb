class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(cat_attr)
    if cat_attr[0] != ''
      cat_attr.values.each do |attrib|
        category = Category.find_or_create_by(attrib)
          categories << category
      end
    end
  end
end
