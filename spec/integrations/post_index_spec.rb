require 'rails_helper'

RSpec.describe 'Post #Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Salomon', photo: 'https://Salomon.jpg',
                        bio: 'Micronaute', posts_counter: 10)
    @post = Post.create(author: @user, title: 'test post', text: 'This is my first post', likes_counter: 3,
                        comments_counter: 5)
    @comment = Comment.create(post_id: @post.id, author_id: @user.id, text: 'test comment')
    visit posts_path(@user)
  end

  it 'It should display the user profile' do
    page.has_content?(@user.photo)
  end

  it 'It should display the username' do
    page.has_content?(@user.name)
  end

  it 'It Should display the amount of posts of the user' do
    page.has_content?(@user.posts_counter)
  end

  it 'It should display the titles of the posts' do
    page.has_content?(@post.title)
  end

  it 'It should display the text of the post' do
    page.has_content?(@post.text)
  end

  it 'It should display the comment of the posts.' do
    page.has_content?(@post.comments)
  end

  it 'It should display the count of comments of each post' do
    page.has_content?(@post.comments_counter)
  end

  it 'It should display the count of likes of each post' do
    page.has_content?(@post.likes_counter)
  end

  it 'It should show the pagination' do
    page.has_content?('Next')
  end
end
