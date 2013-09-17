require 'rspec'
require 'shoulda'
require_relative '../application'

describe User do
  it { should have_many(:topics) }
  it { should have_many(:comments) }
end
