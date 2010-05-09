class Chat < ActiveRecord::Base
  db_magic :slaves => [:slave1, :slave2]

  has_many :comments
  belongs_to :user
end
