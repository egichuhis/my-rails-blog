require 'rails_helper'

RSpec.describe 'User Index Page', type: :system do
  before do
    # Assuming you have some users in the database or use FactoryBot to create them
    @user1 = create(:user, name: 'User One', photo: 'path_to_photo1.jpg')
    @user2 = create(:user, name: 'User Two', photo: 'path_to_photo2.jpg')
    # Assuming you have posts associated with users
    create(:post, author: @user1)
    create(:post, author: @user2)
  end

  it 'displays user information and links to user show page' do
    visit users_path

    # Check if the username of all users is displayed
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)

    # Check if the profile picture for each user is displayed
    expect(page).to have_css("img[src*='path_to_photo1.jpg']")
    expect(page).to have_css("img[src*='path_to_photo2.jpg']")

    # Check if the number of posts each user has written is displayed
    expect(page).to have_content("Number of posts: #{@user1.posts.count}")
    expect(page).to have_content("Number of posts: #{@user2.posts.count}")

    # Check if "See user details" link is present and links to user show page
    click_link 'See user details', match: :first

    # Add a wait time to allow for the redirection to complete
    sleep 1

    # Add debugging information
    puts "Current path: #{current_path}" # Output current path
    puts "Expected path: #{user_path(@user1)}" # Output expected pa

    # Find the element that contains @user1's name and click on the link within it
    find('div', text: @user1.name).click_link

    expect(current_path).to eq(user_path(@user1))
  end
end
