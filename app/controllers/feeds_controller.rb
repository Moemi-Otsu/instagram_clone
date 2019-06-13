class FeedsController < ApplicationController

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

  private

  def feed_params
    params.require(:feed).permit(:image, :image_cache)
  end

end
