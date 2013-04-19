require 'bundler/setup'

require 'active_record'

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database  => "database.db"
)

ActiveRecord::Schema.define do
  create_table :topics, :force => true do |t|
    t.string :title
  end

  create_table :posts, :force => true do |t|
    t.integer :topic_id
    t.string :author
    t.text :content
  end

  add_index :posts, :topic_id
end
