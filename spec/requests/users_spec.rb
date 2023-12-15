require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'renders the index template' do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('MyString')
      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET /users/:id' do
    it 'renders the show template' do
      user = FactoryBot.create(:user)
      get user_path(user)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('Tom')
      expect(response.body).to include('Number of posts')
    end
  end
end
