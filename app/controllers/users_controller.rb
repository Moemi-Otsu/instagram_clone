class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update]

  def index
    @likes = current_user.likes.pluck(:feed_id)
    @like_feeds = Feed.all.where(id: @likes)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
    #before_actionに設定
  end

  def edit
    #before_actionに設定
  end

  def update
    #before_actionに設定
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
