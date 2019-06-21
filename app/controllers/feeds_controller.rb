class FeedsController < ApplicationController
  before_action :set_feed, only:[:edit, :update, :destroy]

  def index
    @feeds = Feed.all.order(id: "desc")
    @users = User.all
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    #@feed = current_user.feeds.build(feed_params)
    # Mail mail_adress = Mail.new()
    if @feed.save
      FeedMailer.feed_mail(@current_user).deliver
      redirect_to feeds_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def edit
    #before_actionに設定
    unless @feed.user_id == current_user.id
      redirect_to feeds_path
    end
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    #@feed = current_user.feeds.build(feed_params)
    render :new if @feed.invalid?
  end

  def update
    #before_actionに設定
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "投稿を編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_path, notice: '投稿を削除しました'
  end

  def show
    @like = current_user.likes.find_by(feed_id: @feed.id)
  end

  private

  def feed_params
    params.require(:feed).permit(:caption, :image, :image_cache)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end

end
