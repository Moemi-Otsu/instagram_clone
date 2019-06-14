class RenameFromBlogIdToFeedIdOnLikes < ActiveRecord::Migration[5.1]
  def change
    rename_column :likes, :blog_id, :feed_id
  end
end
