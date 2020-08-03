class ModifyPostsName < ActiveRecord::Migration[5.1]
  def change
    rename_table :posts, :tweets
  end
end
