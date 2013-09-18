require 'sinatra'
require_relative '../config/application'

get '/' do
  @topics = Topic.all.order('updated_at DESC')
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
  redirect '/'
end

get '/topic/:id' do
  @topic = Topic.find(params[:id])
  @comments = @topic.comments
  erb :topic
end

post '/topic/:id' do
  c = Comment.new
  c.body = params[:body]
  c.topic = Topic.find(params[:id])
  c.save
  redirect "/topic/#{params[:id]}"
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end

