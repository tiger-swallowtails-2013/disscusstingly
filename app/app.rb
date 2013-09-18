require 'sinatra'
require_relative '../config/application'
enable :sessions

get '/' do
  @topics = Topic.all.order('updated_at DESC')
  erb :home
end

get '/login' do
  erb :login
end

post '/login' do
  login
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  signup
  login
  redirect '/'
end

post '/logout' do
  logout
  redirect '/'
end

get '/new_topic' do
  erb :new_topic
end

post '/new_topic' do
  t = Topic.new
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

