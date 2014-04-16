class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :mail
      t.integer :num_articles

      t.timestamps
    end
  end
end
