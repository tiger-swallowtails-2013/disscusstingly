require_relative '../../application'
class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates_presence_of :title, :body
end

