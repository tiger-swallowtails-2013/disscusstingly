require 'sinatra'
require 'pathname'
require 'active_record'
require 'sinatra/activerecord'
require 'sqlite3' unless settings.production? 
require 'pg' if settings.production?

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))

APP_NAME = APP_ROOT.basename.to_s

set :root, APP_ROOT.join("app")

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end


if settings.production?
  set :database, ENV["DATABASE_URL"] ||= "postgresql://localhost/social_media"

elsif settings.test?
  adapter = 'sqlite3'
  DB_PATH = "#{APP_ROOT}/db/Disscusstingly_test.db"
  ActiveRecord::Base.establish_connection :adapter  => adapter,
                                        :database => DB_PATH
elsif settings.development?
  adapter = 'sqlite3'
  DB_PATH = "#{APP_ROOT}/db/Disscusstingly_development.db"
  ActiveRecord::Base.establish_connection :adapter  => adapter,
                                        :database => DB_PATH
end  
  


