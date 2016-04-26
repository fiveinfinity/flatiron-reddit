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
end
