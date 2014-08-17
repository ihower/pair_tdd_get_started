require './boot'
require './topic'
require './post'

describe "TDD example" do

  it "should validate title" do
    topic = Topic.new
    expect( topic.save).to eq(false)
  end

end
