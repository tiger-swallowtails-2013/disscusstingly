require_relative '../../application'

class Thread < ActiveRecord::Base
  validate_presence_of :title, :body

end
