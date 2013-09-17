require_relative '../../application'
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates :body, presence: true
end
