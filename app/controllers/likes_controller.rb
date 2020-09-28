class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @post = Post.find(params[:post_id])
    redirect_to @post
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @like.destroy
    @post = Post.find(params[:post_id])
    redirect_to @post
  end
end
