class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Update the comments counter for a post
  def update_post_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
