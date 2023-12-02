# test/models/user_test.rb
require 'test_helper'
require 'factory_bot'

class UserTest < ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  FactoryBot.definition_file_paths << File.expand_path('../factories', __dir__)
  FactoryBot.reload

  test 'user should be valid' do
    user = User.new(name: 'Example User', posts_counter: 0)
    assert user.valid?
  end

  test 'name should be present' do
    user = User.new(posts_counter: 0)
    assert_not user.valid?
  end

  test 'posts_counter should be a non-negative integer' do
    user = User.new(name: 'Example User', posts_counter: -1)
    assert_not user.valid?
  end

  test 'recent_posts should return a maximum of the 3 most recent posts' do
    user = users(:one)

    create(:post, author: user, created_at: 3.days.ago)
    create(:post, author: user, created_at: 2.days.ago)
    create(:post, author: user, created_at: 1.day.ago)

    assert_equal 3, user.send(:recent_posts).length
  end
end
