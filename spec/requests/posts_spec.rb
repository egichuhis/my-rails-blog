require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET users/:id/posts' do
    it 'renders the index template' do
      user = FactoryBot.create(:user)
      get user_posts_path(user)
      expect(response).to render_template(:index)
      expect(response.body).to include('Number of posts')
      expect(response.body).to include('Tom')
    end
  end

  describe 'GET /posts/:id' do
    it 'renders the show template' do
      post = FactoryBot.create(:post)
      user = FactoryBot.create(:user)
      get user_post_path(user, post)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('Post')
      expect(response.body).to include('Comments')
    end
  end
end
