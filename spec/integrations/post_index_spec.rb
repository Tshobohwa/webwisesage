require 'rails_helper'

RSpec.describe 'Post #Index Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Salomon', photo: 'https://Salomon.jpg',
                        bio: 'Micronaute', posts_counter: 10)
    @post1 = Post.create(author: @user, title: 'test post1', text: 'This is my first post', likes_counter: 3,
                         comments_counter: 3)
    @post2 = Post.create(author: @user, title: 'test post2', text: 'This is my first post', likes_counter: 3,
                         comments_counter: 4)
    @post3 = Post.create(author: @user, title: 'test post3', text: 'This is my first post', likes_counter: 3,
                         comments_counter: 5)
    @comment1 = Comment.create(post_id: @post1.id, author_id: @user.id, text: 'test comment')
    @comment2 = Comment.create(post_id: @post2.id, author_id: @user.id, text: 'test comment')
    @comment3 = Comment.create(post_id: @post3.id, author_id: @user.id, text: 'test comment')
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
    page.has_content?(@post1.title)
    page.has_content?(@post2.title)
    page.has_content?(@post3.title)
  end

  it 'It should display the text of the post' do
    page.has_content?(@post1.text)
    page.has_content?(@post2.text)
    page.has_content?(@post3.text)
  end

  it 'It should display the comment of the posts.' do
    page.has_content?(@post1.comments)
    page.has_content?(@post2.comments)
    page.has_content?(@post3.comments)
  end

  it 'It should display the count of comments of each post' do
    page.has_content?(@post1.comments_counter)
    page.has_content?(@post2.comments_counter)
    page.has_content?(@post3.comments_counter)
  end

  it 'It should display the count of likes of each post' do
    page.has_content?(@post1.likes_counter)
    page.has_content?(@post2.likes_counter)
    page.has_content?(@post3.likes_counter)
  end

  it 'It should show the pagination' do
    page.has_content?('Next')
  end

  it 'It should redirect to post show when the user clicks on one post' do
    find("#post-#{@user.id}#{@post1.id}").click
    expect(current_path).to eq(post_path(@user, @post1))
  end
end
