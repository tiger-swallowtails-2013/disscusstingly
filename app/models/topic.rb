require_relative '../../application'
class Topic < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  has_many :comments
  validates_presence_of :title, :body

end
