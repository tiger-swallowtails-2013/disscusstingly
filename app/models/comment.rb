require_relative '../../config/application'
class Comment < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  belongs_to :topic
  belongs_to :parent_comment, class_name: "Comment", foreign_key: "comment_id"
  has_many :child_comments, class_name: "Comment", foreign_key: "comment_id"
  validates :body, presence: true
end
