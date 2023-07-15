class Api::PostsController < ApplicationController
  def index
    user = User.find(params[:author_id])
    posts = user.posts

    if posts.present?
      render json: { message: 'Posts loaded successfully', data: posts }, status: :ok
    else
      render json: { message: 'Opps! posts list is empty' }, status: :unprocessable_entity
    end
  end
end
