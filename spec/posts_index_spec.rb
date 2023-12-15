# spec/posts_index_spec.rb

require 'rails_helper'

RSpec.describe 'User Post Index Page', type: :system do
  before do
    @user = create(:user, name: 'Test User', photo: 'path_to_photo.jpg')
    @posts = create_list(:post, 10, author: @user)
  end

  it 'displays user information and posts' do
    visit user_posts_path(@user)

    # Check if the user's profile picture is displayed
    expect(page).to have_css("img[src*='path_to_photo.jpg']")

    # Check if the user's username is displayed
    expect(page).to have_content('Test User')

    # Check if the number of posts the user has written is displayed
    expect(page).to have_content('Number of posts: 10') # Assuming 10 posts are created in the before block

    # Check if information for each post is displayed
    @posts.each do |post|
      expect(page).to have_content("Post ##{post.id}")
      expect(page).to have_content(post.title)
      expect(page).to have_content(post.text)
      expect(page).to have_content("Comments: #{post.comments.count}, Likes: #{post.likes.count}")

      # Check if the "See details" button for each post is present and redirects to post's show page
      click_link 'See details', href: user_post_path(@user, post)

      visit user_posts_path(@user)
    end

    # Check if the pagination button is present (add more expectations if needed)
    expect(page).to have_button('Pagination')

    # Click on the pagination button and check the behavior (add expectations if needed)
    click_button 'Pagination'
  end
end
