require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  it 'displays user information and links to user show page' do
    visit users_path

    # Check if the username of all users is displayed
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)

    # Check if the profile picture for each user is displayed
    expect(page).to have_css("img[src*='path_to_photo1.jpg']")
    expect(page).to have_css("img[src*='path_to_photo2.jpg']")

    # Check if the number of posts each user has written is displayed
    expect(page).to have_content("Number of posts: #{user1.posts.count}")
    expect(page).to have_content("Number of posts: #{user2.posts.count}")

    # Check if "See user details" link is present and links to user show page
    click_link 'See user details', match: :first
    expect(current_path).to eq(user_path(@user1))
  end
end
