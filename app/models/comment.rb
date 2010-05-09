class Comment < ActiveRecord::Base
  db_magic :sharded => {
    :key => :user_id,
    :sharded_connection => :users
  }
  belongs_to :user
  belongs_to :chat
end
