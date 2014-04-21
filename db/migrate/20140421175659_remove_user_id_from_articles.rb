class RemoveUserIdFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :user_id, :interger
  end
end
