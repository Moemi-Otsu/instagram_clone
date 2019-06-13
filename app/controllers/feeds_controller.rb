class FeedsController < ApplicationController
  before_action :set_feed, only:[:edit, :update]

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
    redirect_to feeds_path, notice: "投稿しました"
    else
      render 'new'
    end
  end

  def edit
    #before_actionに設定
  end

  def update
    #before_actionに設定
    if @feed.update(feed_params)
      redirect_to feeds_path, notice: "投稿を編集しました"
    else
      render 'edit'
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:caption, :image, :image_cache)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end

end
