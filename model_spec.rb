require './model'

describe "Our TDD example" do

  it "should validate name" do
    Person.create.should be_false
  end

end
