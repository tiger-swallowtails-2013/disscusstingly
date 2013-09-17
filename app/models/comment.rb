require_relative '../../application'
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :thread
  validates :body, presence: true
end
