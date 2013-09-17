require 'sinatra'
require_relative '../application'

get '/' do
  @topics = Topic.all#.order('updated_at')
  erb :home
end

get '/new_topic' do
  erb :new_topic
end

post '/new_topic' do
  t = Topic.new
  params.inspect
  t.title = params[:title]
  t.body = params[:body]
  t.save
end

