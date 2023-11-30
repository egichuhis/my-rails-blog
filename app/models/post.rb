class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  # Update the comments counter for a post
  def update_post_comments_counter
    update(comments_counter: comments.count)
  end

  # Update the likes counter for a post
  def update_post_likes_counter
    update(likes_counter: likes.count)
  end

  # return 5 most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
