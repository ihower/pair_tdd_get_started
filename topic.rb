class Topic < ActiveRecord::Base

  has_many :posts

  # validates_presence_of :title

end
