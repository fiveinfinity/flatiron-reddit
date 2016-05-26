class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :posts, serializer: CategoryPostSerializer
end
