require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "foo.db"
)

ActiveRecord::Schema.define do
  create_table :albums, :force => true do |t|
    t.string :title
  end

  create_table :people, :force => true do |t|
    t.string :name
  end
end

class Album < ActiveRecord::Base
  belongs_to :person
end

class Person < ActiveRecord::Base
  has_many :albums
end

