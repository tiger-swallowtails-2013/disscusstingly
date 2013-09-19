$LOAD_PATH.unshift(File.expand_path('./app'))
ENV['RACK_ENV'] ||= 'test'

require 'app'
require 'rack/test'

RSpec.configure do |config|
  config.before do
    Topic.destroy_all
    User.destroy_all
  end
end
