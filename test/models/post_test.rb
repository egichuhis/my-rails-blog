# test/models/post_test.rb
require 'test_helper'
require 'factory_bot'

class PostTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods # Add this line to include FactoryBot methods

  def setup
    @user = create(:user) # Ensure the user is created before testing
  end

  test 'post should be valid' do
    post = build(:post, title: 'Example Post', text: 'This is the content of the post', author: @user)
    assert post.valid?
  end

  test 'title should not be too long' do
    post = build(:post, title: 'a' * 251, text: 'This is the content of the post', author: @user)
    assert_not post.valid?
  end

  test 'comments_counter should be a non-negative integer' do
    post = build(:post, title: 'Example Post', text: 'This is the content of the post', author: @user,
                        comments_counter: -1)
    assert_not post.valid?
  end

  test 'likes_counter should be a non-negative integer' do
    post = build(:post, title: 'Example Post', text: 'This is the content of the post', author: @user,
                        likes_counter: -1)
    assert_not post.valid?
  end

  test 'update_posts_counter should update the posts counter for the author' do
    create(:post, author: @user)
    assert_equal 1, @user.reload.posts_counter
  end

  test 'recent_comments should return a maximum of the 5 most recent comments' do
    post = create(:post)
    user = create(:user)

    # Create some comments for the post
    create(:comment, post:, user:, created_at: 5.days.ago)
    create(:comment, post:, user:, created_at: 4.days.ago)
    create(:comment, post:, user:, created_at: 3.days.ago)
    create(:comment, post:, user:, created_at: 2.days.ago)
    create(:comment, post:, user:, created_at: 1.day.ago)
    create(:comment, post:, user:, created_at: Time.current)

    assert_equal 5, post.recent_comments.length
  end
end
