require 'rails_helper'
RSpec.describe 'User #Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Salomon', photo: 'https://salomon.jpg',
                        bio: 'Micronaute', posts_counter: 0)
    @post1 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user.id)
    @post2 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user.id)
    @post3 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user.id)
    @post4 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 2, author_id: @user.id)

    visit user_path(@user)
  end

  it 'It should display the profile picture.' do
    expect(page.html).to include(@user.photo)
  end

  it 'It should display the username username.' do
    expect(page).to have_content(@user.name)
  end

  it 'It should display the post count' do
    expect(page.html).to have_content(@user.posts_counter)
  end

  it 'It should display the user bio' do
    page.has_content?(@user.bio)
  end

  it 'It should display the user 3 last posts' do
    recent_posts = @user.posts
    recent_posts.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  it 'It should have a see all post button' do
    page.has_button?('See all posts')
  end

  it 'it should redirect to a show post page.' do
    page.first('.post__link').click
    expect(current_path).to eq("/users/#{@user.id}/posts/#{@post3.id + 1}")
  end

  it 'It should redirect to posts index page' do
    click_link('See all posts')
    expect(current_path).to eq(posts_path(@user))
  end
end
