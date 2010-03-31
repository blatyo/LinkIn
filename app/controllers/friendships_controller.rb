class FriendshipsController < ApplicationController
  before_filter :require_no_user, :only => [:index, :show]
  before_filter :require_user, :only => [:new, :create, :update, :destroy]

  def index
    redirect_to user_path(current_user)
  end

  def show
    redirect_to user_path(current_user)
  end

  def new
    @friendship1 = Friendship.new
    @friendship2 = Friendship.new
  end

  def create
    @friend = User.find(params[:friend_id])

    if Friendship.request?(current_user, @friend)
      redirect_to user_friends_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @friend = User.find(params[:friend_id])

    if Friendship.accept?(current_user, @friend)
      flash[:notice] = 'Friend sucessfully accepted!'
      redirect_to user_friends_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @friend = User.find(params[:id])

    Friendship.remove(current_user, @friend)
    redirect_to user_friends_path(:user_id => current_user)
  end
end
