require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }

  before { subject.save }

  it 'new like should be saved in the database' do
    expect(subject.new_record?).to be_falsy
  end

  describe 'update_posts_likes_counter' do
    user = User.create(name: 'Man', photo: 'photo', bio: 'bio', posts_counter: 0)
    post = Post.create(title: 'post', text: 'This is my post', author_id: user.id, comments_counter: 0,
                       likes_counter: 0)

    subject { described_class.create(post:, author_id: user.id) }

    it 'posts comments count should increase' do
      expect(subject.post.likes_counter).to eq(post.likes_counter)
    end
  end
end
