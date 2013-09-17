require_relative '../../application'

class CreateTableTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :body
      t.integer :comment_id
      t.integer :user_id
      t.timestamps
    end
  end
end
