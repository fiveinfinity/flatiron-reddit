class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :title, :author_id, :created_at
  has_many :categories
  has_many :comments
end
