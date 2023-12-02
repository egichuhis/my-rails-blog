class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  # return 5 most recent comments for a given post
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  # updates the posts counter for a user
  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
