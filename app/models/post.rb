class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :users, through: :comments
end
