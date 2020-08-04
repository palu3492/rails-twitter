class RemoveTitleFromTweets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tweets, :title
  end
end
