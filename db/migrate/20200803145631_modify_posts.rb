class ModifyPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :tweets, :username

    add_reference :tweets, :user, foreign_key: true
  end
end
