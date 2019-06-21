class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]

  def index
    @likes = current_user.likes.pluck(:feed_id)
    @like_feeds = Feed.all.where(id: @likes)
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    #ユーザー画像のデフォルト値を入力したかった
    @user = User.new(user_params)
    #if @user.image.present?
    #  @user.image = "images/default_person_icon.png"
    #end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    #before_actionにset_userを設定
    @feeds = current_user.feeds.pluck(:user_id)
    @user_feeds = Feed.all.where(user_id: set_user)
  end

  def edit
    #before_actionにset_userを設定
    unless current_user.id == @user.id
      redirect_to new_session_path
    end
  end

  def update
    #before_actionにset_userを設定
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "プロフィールを編集しました"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
