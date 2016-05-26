class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user_id, :post_id, :author_id
  has_one :post, serializer: CategoryPostSerializer
end
