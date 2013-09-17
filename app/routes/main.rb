require 'sinatra'
require_relative 'application'

get '/new_thread' do
  erb :new_thread
end

post '/new_thread' do
  #put the information in the database
  "Title: #{params[:title]}<p>Body: #{params[:body]}"
end

