class PostsController < ApplicationController
  def index
    id = params[:id].to_i
    @user = User.find(id)
    @posts = Post.where({ author_id: id })
  end

  def show
    id = params[:id].to_i
    author_id = params[:author_id].to_i
    @author = User.find(author_id)
    @post_author = @author.name
    @post = Post.find(id)
    @likes = @post.likes_counter
    @comments_count = @post.comments_counter
    @comments = Comment.where(post_id: id)
  end

  def new
    @post = Post.new
  end

  def create
    title = post_params[:title]
    text = post_params[:text]
    post = Post.new(author_id: current_user.id, title:, text:, comments_counter: 0, likes_counter: 0)

    if post.save
      redirect_to "/users/#{current_user.id}/posts", notice: 'Post created successfully!!'
    else
      render :new, notice: 'An error occured while creating the post!'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
