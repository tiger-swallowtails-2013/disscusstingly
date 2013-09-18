require_relative '../../config/application'
class User < ActiveRecord::Base
  has_many :topics
  has_many :comments

  validates_presence_of :email, :password
  validates_uniqueness_of :email
end
