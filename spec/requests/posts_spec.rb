require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'renders the index template' do
      get posts_index_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('User name')
      expect(response.body).to include('Number of posts: x')
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
