class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 9)
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:seccess] = "投稿内容を変更しました！"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:seccess] = "投稿内容を削除しました"
    redirect_to posts_url
  end

  private

    def post_params
      params.require(:post).permit(:name, :price,
                    :store, :address, :image, :comment)
    end
end
