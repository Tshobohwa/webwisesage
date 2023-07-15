require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do

  path '/api/users/{author_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: 'author_id', in: :path, type: :string, description: 'author_id'

    get('list posts') do
      response(200, 'successful') do
        let(:author_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
