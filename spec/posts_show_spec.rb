# spec/system/posts_show_spec.rb

require 'rails_helper'

RSpec.describe 'Post Show Page', type: :system do
  before do
    @user = create(:user, name: 'Test User', photo: 'path_to_photo.jpg')
    @post = create(:post, title: 'Test Post', text: 'Post content', author: @user)
    @comments = create_list(:comment, 5, post: @post, user: @user)
    @likes = create_list(:like, 3, post: @post, user: @user)
  end

  it 'displays post information, comments, and likes' do
    visit user_post_path(@user, @post)

    # Check if the post's title and author are displayed
    expect(page).to have_content(/Post #[0-9]+ by Test User/)

    # Check if the post body is displayed
    expect(page).to have_content('Post content')

    # Check if the "likes/form" partial is rendered
    expect(page).to have_selector('form[action*="/likes"]')

    # Check if information for each comment is displayed
    @comments.each do |comment|
      expect(page).to have_content("Username: #{comment.user.name}")
      expect(page).to have_content(comment.text)
    end

    # Check if the "comments/form" partial is rendered
    expect(page).to have_selector('form[action*="/comments"]')
  end
end
