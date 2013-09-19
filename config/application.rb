require 'sinatra'
require 'pathname'
require 'active_record'
require 'sqlite3' unless settings.production? 

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))
APP_NAME = APP_ROOT.basename.to_s

set :root, APP_ROOT.join("app")

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

adapter = 'sqlite3'
if settings.test?
  DB_PATH = "sqlite3:///db/Disscusstingly_test.db"
elsif settings.development?
  DB_PATH = "sqlite3:///db/Disscusstingly_development.db"
else
  DB_PATH = ENV['DATABASE_URL']
  ActiveRecord::Base.establish_connection(DB_PATH)
end  

unless settings.production?
  ActiveRecord::Base.establish_connection :adapter  => adapter,
                                          :database => DB_PATH
end


