require './boot'
require './topic'
require './post'

describe "TDD example" do

  it "should validate title" do
    Topic.create.should be_false
  end

end
