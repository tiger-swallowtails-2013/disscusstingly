require 'pathname'
require 'sqlite3'
require 'active_record'

APP_ROOT = Pathname.new(File.expand_path(File.join(File.dirname(__FILE__), '.')))

APP_NAME = APP_ROOT.basename.to_s

DB_PATH  = APP_ROOT.join('db', APP_NAME + ".db").to_s

Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

ActiveRecord::Base.establish_connection :adapter  => 'sqlite3',
                                        :database => DB_PATH
# p APP_ROOT
# p APP_NAME
# p DB_PATH
# p __FILE__
# p File.expand_path(File.dirname(__FILE__))
# p File.join(File.dirname(__FILE__), '.')
# p File.expand_path(File.join(File.dirname(__FILE__), '.'))
