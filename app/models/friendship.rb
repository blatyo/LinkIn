class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key =>'friend_id'

  def self.request?(user, friend)
    friendship1 = Friendship.create :user_id => user.id, :friend_id => friend.id, :status => "requested"
    friendship2 = Friendship.create :user_id => friend.id, :friend_id => user.id, :status => "pending"
    friendship1.save && friendship2.save
  end

  def self.accept?(user, friend)
    find_pair(user, friend).inject(true) do |accepted, friendship|
      accepted && friendship.update_attributes(:status => "accepted")
    end
  end

  def self.remove(user, friend)
    find_pair(user, friend).each(&:destroy)
  end

  private

  def self.find_pair(user, friend)
    [Friendship.find_by_user_id_and_friend_id(user.id, friend.id),
     Friendship.find_by_user_id_and_friend_id(friend.id, user.id)]
  end
end
