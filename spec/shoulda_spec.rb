require 'rspec'
require 'shoulda'
require_relative '../config/application'

describe User do
  it { should validate_presence_of(:password)}
  it { should validate_uniqueness_of(:email)}
  it { should have_many(:topics) }
  it { should have_many(:comments) }
end
