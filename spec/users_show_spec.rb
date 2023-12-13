# spec/system/users_show_spec.rb

require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  before do
    @user = create(:user, name: 'Test User', photo: 'path_to_photo.jpg', bio: 'This is a test bio')
    create_list(:post, 5, author: @user)
  end

  it 'displays user information and posts' do
    visit user_path(@user)

    # Check if the user's profile picture is displayed
    expect(page).to have_css("img[src*='path_to_photo.jpg']")

    # Check if the user's username is displayed
    expect(page).to have_content('Test User')

    # Check if the number of posts the user has written is displayed
    expect(page).to have_content('Number of posts: 5') # Assuming 5 posts are created in the before block

    # Check if the user's bio is displayed
    expect(page).to have_content('This is a test bio')

    # Check if the first 3 posts are displayed
    @user.posts.limit(3).each do |post|
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
    end

    # Check if the "See all posts" button is present
    expect(page).to have_link('See all posts', href: user_posts_path(@user))
  end
end
