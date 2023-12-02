# test/models/like_test.rb
require 'test_helper'
require 'factory_bot'

class LikeTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  def setup
    @user = create(:user)
    @post = create(:post, author: @user)
  end

  test 'like should be valid' do
    like = build(:like, user: @user, post: @post)
    assert like.valid?
  end

  test 'update_post_likes_counter should update the likes counter for the post' do
    create(:like, user: @user, post: @post)
    assert_equal 1, @post.reload.likes_counter
  end
end
