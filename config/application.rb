require 'sinatra'
require 'pathname'
require 'active_record'
require 'sqlite3' unless settings.production? 
require 'sinatra/activerecord'


APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

set :root, APP_ROOT.join("app")
set :database, ENV["DATABASE_URL"] ||= "postgresql://localhost/social_media"

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

# adapter = 'sqlite3'
# if settings.test?
#   DB_PATH = "#{APP_ROOT}/db/Disscusstingly_test.db"
# elsif settings.development?
#   DB_PATH = "#{APP_ROOT}/db/Disscusstingly_development.db"
# else
#   DB_PATH = ENV['DATABASE_URL']
#   adapter = 'postgresql'
# # end  

# ActiveRecord::Base.establish_connection :adapter  => adapter,
#                                         :database => DB_PATH
