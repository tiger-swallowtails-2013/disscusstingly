require 'rspec'
require 'shoulda'
require_relative '../application'


describe User do
  it { should validate_presence_of(:password)}
  it { should validate_uniqueness_of(:email)}
  it { should have_many(:topics) }
  it { should have_many(:comments) }
end

describe Topic do
  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:body)}
  it { should have_one(:user) }
end

describe Comment do
  it { should validate_presence_of(:body)}
  it { should have_one(:user) }
  it { should have_one(:topic) }
end
