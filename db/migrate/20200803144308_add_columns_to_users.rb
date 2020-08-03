class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_index :users, :username

    add_column :users, :name, :string

    remove_column :users, :email

  end
end
