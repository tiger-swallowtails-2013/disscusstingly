require 'sinatra'
require 'pathname'
require 'sqlite3'
require 'active_record'

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '..')))
APP_NAME = APP_ROOT.basename.to_s


set :root, APP_ROOT.join("app")


Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

if settings.test?
  DB_PATH = "sqlite3:///db/Disscusstingly_test.db"
elsif settings.development?
  DB_PATH = "sqlite3:///db/Disscusstingly_development.db"
end

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
