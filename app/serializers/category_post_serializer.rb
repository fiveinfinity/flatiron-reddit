class CategoryPostSerializer < ActiveModel::Serializer
  attributes :id, :content, :title, :author_id, :created_at
end
