class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @feed_items = Post.paginate(page: params[:page], per_page: 5)
    @user = current_user
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    # @post.images.attach(params[:post][:image])
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
      # if params[:post][:image] != nil
      #   @post.image.attach(params[:post][:image])
      # end
      flash[:seccess] = "投稿内容を変更しました！"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "投稿内容を削除しました"
    redirect_to posts_url
    # redirect_to request.referrer || root_url
    # redirect_back(fallback_location: root_url)
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @feed_items = Post.search(params[:search]).paginate(page: params[:page], per_page: 5)
  end

  private

    def post_params
      params.require(:post).permit(:name, :price,
                    :store, :address, :content, images: [])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
