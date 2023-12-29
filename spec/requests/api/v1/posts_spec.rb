require 'swagger_helper'

describe 'Posts API' do
  path '/api/v1/users/{user_id}/posts' do
    get 'Retrieves all posts for a user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :user_id, in: :path, type: :integer

      response '200', 'posts found' do
        schema type: :array,
               items: { '$ref' => '#/definitions/post' }

        let(:user_id) { create(:user).id }
        run_test!
      end

      # Add more response scenarios as needed
    end

    # Add more paths for other actions (e.g., create, show, update, destroy)
  end
end
