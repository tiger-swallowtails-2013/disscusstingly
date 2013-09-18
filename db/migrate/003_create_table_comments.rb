#require_relative '../../config/application'

class CreateTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :topic
      t.belongs_to :user
      
      t.timestamps
    end
  end
end
