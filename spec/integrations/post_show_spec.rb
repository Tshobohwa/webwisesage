require 'rails_helper'
RSpec.describe 'Post #Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Salomon', photo: 'https://Salomon.jpg',
                        bio: 'Micronaute', posts_counter: 10)
    @post = Post.create(author: @user, title: 'test post', text: 'This is my first post', likes_counter: 3,
                        comments_counter: 2)
    @comment = Comment.create(post_id: @post.id, author_id: @user.id, text: 'test comment')
    visit post_path(@user, @post)
  end
  it 'It should display the post title' do
    page.has_content?(@post.title)
  end
  it 'It should display the post author.' do
    page.has_content?(@post.author)
  end

  it 'It should display the count of comments' do
    page.has_content?(@post.comments_counter)
  end
  it 'It should display the count of likes' do
    page.has_content?(@post.likes_counter)
  end

  it 'It should display the post body.' do
    page.has_content?(@post.text)
  end
  it 'It should display the author of each commentor.' do
    page.has_content?(@comment.author.name)
    page.has_content?(@comment.text)
  end
end
