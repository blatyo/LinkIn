class Comment < ActiveRecord::Base
  db_magic :slaves => [:slave1, :slave2]
  belongs_to :user
  belongs_to :chat
end
