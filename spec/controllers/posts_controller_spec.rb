require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user1 = User.create(name: 'Salomon', photo: 'https://salomon.jpg',
                         bio: 'Micronaute', posts_counter: 0)
    @post1 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user1.id)
    @post2 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user1.id)
    @post3 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user1.id)
    @post4 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user1.id)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: { id: @user1.id }
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index, params: { id: @user1.id }
      expect(response).to render_template(:index)
    end
    it 'includes the template content in the response body' do
      get :index, params: { id: @user1.id }
      expect(response.body).to include(response.body)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { author_id: 1, id: 1 }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { author_id: 1, id: 1 }
      expect(response).to render_template(:show)
    end
    it 'includes the template content in the response body' do
      get :show, params: { author_id: 1, id: 1 }
      expect(response.body).to include(response.body)
    end
  end
end
