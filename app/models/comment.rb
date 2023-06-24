class Comment < ApplicationRecord
  belongs_to :post, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  before_save :update_user_posts_counter

  private

  def update_comments_counter
    post.update(comments_counter: post.comments.count)
  end
end
