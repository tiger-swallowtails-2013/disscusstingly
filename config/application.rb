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


if settings.test?
  DB_PATH = "#{APP_ROOT}/db/Disscusstingly_test.db"
  ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
elsif settings.development?
  DB_PATH = "#{APP_ROOT}/db/Disscusstingly_development.db"
  ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
else
  #configure :production do
	ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

end

