require_relative '../../application'

class TestCreate < ActiveRecord::Migration
  def change
    create_table :threads do |t|
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
