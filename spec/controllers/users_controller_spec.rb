require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'includes the template content in the response body' do
      get :index
      expect(response.body).to include(response.body)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: 1 }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { id: 1 }
      expect(response).to render_template(:show)
    end

    it 'includes the template content in the response body' do
      get :show, params: { id: 1 }
      expect(response.body).to include(response.body)
    end
  end
end
