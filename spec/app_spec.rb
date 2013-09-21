require 'spec_helper'

describe "Homepage" do
  let!(:user) { User.create(email: "user@example.com", password: "password") }
  let!(:topic) { 
    # user.topics.create(title: "Awesome Post!", body: "this is super awesome" ) 
    Topic.create(title: "Awesome Post!", body: "this is super awesome",user_id: user.id)
  }
  it "should list topics" do
    # topic = Topic.create(title: "Awesome Post!", body: "this is super awesome", user_id: user.id)
    get '/'
    expect(last_response.body).to include topic.title
  end

  it "should not allow guest to post a topic" do
    user = User.create(email: "user@example.com", password: "password")
    topic = Topic.create(title: "Awesome Post!", body: "this is super awesome", user_id: user.id)

  end

  it "should not allow guest to post a comment" do
  end

end

describe "Validations" do
  it "should require email for new user" do
    user = User.create
    expect(user).not_to be_persisted
  end
  it "should not save user when email provided without password" do
    user = User.create(email: "user@example.com")
    expect(user).not_to be_persisted
  end
  it "should save user when email and password provided" do
    user = User.new(email: "user232@example.com", password: "password")
    user.save
    expect(user).to be_valid
  end
  it "should not save user with duplicate email" do
    user_1 = User.create!(email: "aaauser@example.com", password: "whatever")
    user_2 = User.create(email: "aaauser@example.com", password: "pass")
    expect(user_2).not_to be_valid
  end
  it "should not save topic with no title" do
    topic = Topic.create
    expect(topic).not_to be_persisted
  end
  it "should not save topic with title and no body" do
    topic = Topic.create(:title => "Title")
    expect(topic).not_to be_persisted
  end
  it "should not save topic with body and no title" do
    topic = Topic.create(:body => "Body.. Body... Body")
    expect(topic).not_to be_persisted
  end
  it "should save topic with title and body" do
    topic = Topic.create(:title => "Title", :body => "Body, body, body")
    expect(topic).to be_persisted
  end
  it "should not save comment with no body" do
    comment = Comment.create
    expect(comment).not_to be_persisted
  end
  it "should save comment with body" do
    comment = Comment.create(:body => "body...body...body")
    expect(comment).to be_persisted
  end
end

describe "Associations" do

  it "should show many topics for users" do
    user = User.create(email: "user@example.com", password: "password")
    topic_1 = Topic.create(:title => "Title", :body => "User, topic relationship")
    topic_2 = Topic.create(:title => "Another title", :body => "Babs in tic")
    user.topics << topic_1
    user.topics << topic_2
    expect(user.topics).to eq([topic_1, topic_2])
  end

  it "should show many comments for a topic" do
    topic = Topic.create(:title => "this title", :body => "Zwhaaa !")
    comment_1 = Comment.create(:body => "comment on zwhaa")
    comment_2 = Comment.create(:body => "another f'in comment")
    topic.comments << comment_1
    topic.comments << comment_2
    expect(topic.comments).to eq([comment_1, comment_2])
  end

  # it "should allow many comments on comments" do 
  #   parent_comment = Comment.create(:body => "This is a parent comment on a topic")
  #   child_comment_1 = Comment.create(:body => "This is a child comment on parent comment")
  #   child_comment_2 = Comment.create(:body => "This is aanother child comment")
  #   parent_comment.child_comments << child_comment_1
  #   parent_comment.child_comments << child_comment_2
  #   expect(parent_comment.child_comments).size.to_eq(2)
  # end

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
