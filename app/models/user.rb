class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # returns the 3 most recent posts for a given user
  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  # updates the posts counter for a user
  def update_posts_counter
    update(posts_counter: posts.count)
  end
end
