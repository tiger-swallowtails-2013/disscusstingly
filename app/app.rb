require 'sinatra'
require_relative '../application'
enable :sessions

get '/' do
  @topics = Topic.all.order('updated_at DESC')
  erb :home
end

post '/login' do
  #authenticate user
  #add to session
  #redirect to home_page
end

get '/signup' do
  #create a new user
  #add to session
  #redirect to home_page
end

post '/signout' do
  #sign user out
  #redirect to home_page
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

get '/:id' do
  @topic = Topic.find(params[:id])
  @comments = @topic.comments
  erb :topic
end

post '/:id' do
  c = Comment.new
  c.body = params[:body]
  c.topic = Topic.find(params[:id])
  c.save
  redirect "/#{params[:id]}"
end
