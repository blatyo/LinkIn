class Chat < ActiveRecord::Base
  db_magic :sharded => {
    :key => :user_id,
    :sharded_connection => :users
  }
  has_many :comments
  belongs_to :user
end
