class PostsController < ApplicationController
  def index
    id = params[:id].to_i
    @user = User.find(id)
    @posts = Post.where({ author_id: id })
  end

  def show
    id = params[:id].to_i
    author_id = params[:author_id].to_i
    @post_author = User.find(author_id).name
    @post = Post.find(id)
    @likes = @post.likes_counter
    @comments_count = @post.comments_counter
    @comments = Comment.where(post_id: id)
  end
end
