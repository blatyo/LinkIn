class FriendshipsController < ApplicationController
  before_filter :require_user

  def create
    friend = User.find(params[:user_id])

    if Friendship.request?(current_user, friend)
      flash[:notice] = 'Friend request sent!'
    else
      flash[:notice] = 'Unable to send friend request.'
    end

    redirect_to :back
  end

  def update
    friend = User.find(params[:user_id])

    if Friendship.accept?(current_user, friend)
      flash[:notice] = 'Friend sucessfully accepted!'
    else
      flash[:notice] = 'Unable to accept friend request.'
    end

    redirect_to :back
  end

  def destroy
    friend = User.find(params[:user_id])

    if current_user.friend?(friend)
      flash[:notice] = 'Friend removed!'
    elsif current_user.requested_friend?(friend)
      flash[:notice] = "Friend request cancelled"
    else
      flash[:notice] = "Friend request rejected"
    end

    Friendship.remove(current_user, friend)

    redirect_to :back
  end
end
