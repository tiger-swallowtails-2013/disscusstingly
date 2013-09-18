#require_relative '../../config/application'

class CreateTableTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :body
      t.belongs_to :user

      t.timestamps
    end
  end
end
