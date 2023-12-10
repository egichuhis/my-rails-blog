# user.rb
class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :name, presence: true

  # returns the 3 most recent posts for a given user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
