# test/models/comment_test.rb
require 'test_helper'
require 'factory_bot'

class CommentTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  def setup
    @user = create(:user)
    @post = create(:post, author: @user)
  end

  test 'comment should be valid' do
    comment = build(:comment, user: @user, post: @post)
    assert comment.valid?
  end

  test 'update_post_comments_counter should update the comments counter for the post' do
    create(:comment, user: @user, post: @post)
    assert_equal 1, @post.reload.comments_counter
  end
end
