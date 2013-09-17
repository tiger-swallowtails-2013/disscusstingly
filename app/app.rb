require 'sinatra'
# require_relative './models/thread'
require_relative '../application'

get '/new_thread' do
  erb :new_thread
end

post '/new_thread' do
  thread = Thread.new
  thread.title = params[:title]
  thread.body = params[:body]
  thread.save
end

