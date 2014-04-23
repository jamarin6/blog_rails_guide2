class AddDefaultValueToNumArticles < ActiveRecord::Migration
  def up
  	change_column :users, :num_articles, :integer, :default => 0
  end

  def down
  	change_column :users, :num_articles, :integer
  end
end
