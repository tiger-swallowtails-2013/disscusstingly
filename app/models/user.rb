require_relative '../../application'
class User < ActiveRecord::Base
  has_many :threads
  has_many :comments

  validates_presence_of :email, :password
  validates_uniqueness_of :email
end
