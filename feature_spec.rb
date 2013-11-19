require './boot'
require './topic'
require './post'
require './article'

describe "TDD example" do

  before do
    Topic.delete_all
    Post.delete_all
  end

  it "should validate title" do
    topic = Topic.new
    topic.save.should be_false
  end

  it "should create topic from article" do
    article = Article.build( :title => "foobar" )
    article.save

    Topic.last.title.should eq("foobar")
  end

  it "should create topic and post from article" do
    article = Article.build( :title => "foobar", :posts_attributes => [ { :content => "a" }, {:content => "b"} ] )

    Topic.count.should eq(0)

    article.save

    topic = Topic.last
    topic.title.should eq("foobar")
    topic.posts.count.should eq(2)
    topic.posts.last.content.should eq("b")
  end

  describe "existed article" do
    before do
      @topic = Topic.create!(:title => "foobar")
      @post = @topic.posts.create!( :content => "A" )
    end

    it "should find existed article" do
      @article = Article.find( @topic.id )

      @article.class.should eq(Article)

      @article.title.should eq("foobar")
    end

    it "should update topic" do
      @article = Article.find( @topic.id )

      @article.attributes = { :title => "foobar2" }
      @article.save

      @topic.reload
      @topic.title.should eq("foobar2")
    end

    it "should update posts" do
      @article = Article.find( @topic.id )

      @article.attributes = { :posts_attributes => [ { :id => @post.id, :content => "Z" }, { :content => "X" } ] }
      @article.save

      @post.reload
      @post.content.should eq("Z")

      @topic.posts.count.should eq(2)
    end

  end

end
