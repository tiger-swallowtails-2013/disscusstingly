require 'rake'
require_relative 'config/application'

desc "create the database"
task "db:create" do
  puts "Creating file #{DB_PATH} if it doesn't exist..."
  touch DB_PATH
end

desc "migrate the database"
task "db:migrate" do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./application"
end

desc "drop the database"
task "db:drop" do
  rm_f DB_PATH
end

desc "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end

desc "reset database"
task "db:reset" do
  exec "rake db:drop && rake db:create && rake db:migrate && rake db:seed"
end
