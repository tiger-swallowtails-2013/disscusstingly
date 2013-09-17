require_relative '../../application'

class CreateTableTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
