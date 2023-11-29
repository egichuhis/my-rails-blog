class Post < ApplicationRecord
  belongs_to :author, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
end
