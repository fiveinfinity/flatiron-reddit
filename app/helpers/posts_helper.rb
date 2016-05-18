module PostsHelper
  def author_of_post_email(post)
    if user = User.find_by(id: post.author_id)
      user.email
    end
  end

  def author_of_post_id(post)
    if user = User.find_by(id: post.author_id)
      user.id
    end
  end

  def unique_category
    category_arr = []

    Post.all.each do |post|
      post.categories.each do |category|
        if category != ""
          category_arr << category
        end
      end
    end

    category_arr.uniq
  end
end
