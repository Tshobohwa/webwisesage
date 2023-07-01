class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:id].to_i)
    @comment = Comment.new
  end

  def create
    text = params[:comment][:text]
    post_id = params[:id].to_i
    comment = Comment.new(author_id: current_user.id, text:, post_id:)

    if comment.save
      redirect_to "/users/#{current_user.id}/posts/#{post_id}", notice: 'comment added successfully!!'
    else
      render :new, notice: 'An error occured while adding the comment!'
    end
  end
end
