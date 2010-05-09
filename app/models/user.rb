class User < ActiveRecord::Base
  db_magic :sharded => {
    :key => :id,
    :sharded_connection => :users
  }
  acts_as_authentic
  has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
  has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'"
  has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'"
  has_many :friendships, :dependent => :destroy
  has_many :chats

  def friend?(user)
    friends.include?(user)
  end

  def pending_friend?(user)
    pending_friends.include?(user)
  end

  def requested_friend?(user)
    requested_friends.include?(user)
  end

  def no_relation?(user)
    !friend?(user) && !requested_friend?(user) && !pending_friend?(user)
  end

  def self.search(query)
    return nil unless query
    User.find(:all, :conditions => ["login like ?", "%#{query}%"])
  end
end
