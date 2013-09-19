require 'spec_helper'


describe "Homepage" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "should list topics" do
    user = User.create(email: "user@example.com", password: "password")
    topic = Topic.create(title: "Awesome Post!", body: "this is super awesome", user_id: user.id)
    get '/'
    expect(last_response.body).to include topic.title
  end
end
  # allows guest to register as Poster with Username and Password
  # Poster may create new discussion
  # Poster must provide title when creating discussion
  # Poster must provide body when creating discussion
  # Guest may see list of discussions
  # Poster may respond to discussion
  
  # Poster must provide body when responding to discussion
  # Poster may not respond to discussion as someone else
  # Guest may not post responses to discussions
