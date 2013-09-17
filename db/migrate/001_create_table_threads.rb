require_relative '../../application'

class CreateTableThreads < ActiveRecord::Migration
  def change
    create_table :threads do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
