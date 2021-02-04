class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html { redirect_to post_likes_path(@post) }
      format.js
    end
    # redirect_to @post
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    like.destroy
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.html { redirect_to post_likes_path(@post) }
      format.js
    end
    # redirect_to @post;
  end
end
