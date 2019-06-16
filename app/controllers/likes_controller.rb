class LikesController < ApplicationController

  def create
    like = current_user.likes.create(feed_id: params[:feed_id])
    redirect_to feeds_url, notice: "#{like.feed.user.name}さんの投稿をLikeしました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to feeds_url, notice: "#{like.feed.user.name}さんの投稿をLike解除しました"
  end

end
