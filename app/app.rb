require_relative '../config/application'
require_relative './session_helper'
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
  authenticate
  erb :new_topic
end

post '/new_topic' do
  t = Topic.new
  t.title = params[:title]
  t.body = params[:body]
  t.author = current_user
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
  c.author = current_user
  c.save
  redirect "/topic/#{params[:id]}"
end

get '/user/:id' do
  #show all posts and comments that belong to user_id
  "User Page #{params[:id]}"
end

