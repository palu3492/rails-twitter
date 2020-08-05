class CommentsPostIdToTweetId < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :post_id, :tweet_id
  end
end
