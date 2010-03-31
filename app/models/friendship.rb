class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'

  def self.request?(user, friend)
    friendship1 = Friendship.create :user_id => user.id, :friend_id => friend.id, :status => "requested"
    friendship2 = Friendship.create :user_id => friend.id, :friend_id => user.id, :status => "pending"
    friendship1.save && friendship2.save
  end

  def self.accept?(user, friend)
    friendship1 = Friendship.find_by_user_id_and_friend_id(user.id, friend.id)
    friendship2 = Friendship.find_by_user_id_and_friend_id(friend.id, user.id)
    friendship1.update_attributes(:status => "accepted") && friendship2.update_attributes(:status => "accepted")
  end

  def self.remove(user, friend)
    Friendship.find_by_user_id_and_friend_id(user.id, friend.id).destroy
    Friendship.find_by_user_id_and_friend_id(friend.id, user.id).destroy
  end
end
