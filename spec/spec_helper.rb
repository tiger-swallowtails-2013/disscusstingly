$LOAD_PATH.unshift(File.expand_path('./app'))
ENV['RACK_ENV'] ||= 'test'

require 'app'
require_relative '../app/app'
require_relative '../config/application'
require 'rack/test'

include Rack::Test::Methods

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.before(:suite) do
    Topic.destroy_all
    User.destroy_all
  end
end
