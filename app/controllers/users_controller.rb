class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    redirect_to root_url and return unless @user.activated
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.avatar.attach(params[:user][:avatar])
    if @user.save
      @user.send_activation_email
      flash[:info] = "登録は完了しておりません。メールの内容を確認してください"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      if params[:user][:avatar] != nil
        @user.avatar.attach(params[:user][:avatar])
      end
      flash[:seccess] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:seccess] = "退会しました"
    redirect_to users_url
  end

  def likes
    @user = User.find(params[:id])
    @posts = @user.liked_posts.paginate(page: params[:page])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email,
                      :password, :password_confirmation, :avatar)
    end

    # before action

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
