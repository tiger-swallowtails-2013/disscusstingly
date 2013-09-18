require_relative '../../application'
class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :topic
  validates :body, presence: true
end
