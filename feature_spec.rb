require './boot'
require './topic'
require './post'

describe "TDD example" do

  it "should validate title" do
    topic = Topic.new
    topic.save.should be_false
  end

end
