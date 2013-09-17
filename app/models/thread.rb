require_relative '../../application'

class Thread < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validate_presence_of :title, :body

end
