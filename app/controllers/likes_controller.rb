class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id].to_i)
    @author_id = params[:author_id].to_i
    @like = @post.likes.new(author_id: current_user.id)
    if @like.save
      redirect_to "/users/#{@author_id}/posts/#{@post.id}", notice: 'Post liked successfully!!'
    else
      redirect_to "/users/#{@author_id}/posts/#{@post.id}", notice: 'Failed to like post.'
    end
  end
end
